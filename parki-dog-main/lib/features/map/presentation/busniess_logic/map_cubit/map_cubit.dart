import 'package:flutter/material.dart';
import 'package:parki_dog/app/parki_dog.dart';
import 'package:parki_dog/core/routes/routes_manager.dart';
import 'package:parki_dog/features/map/data/models/place_details.dart';
import 'package:parki_dog/features/map/export/map_export.dart';
import 'package:dio/dio.dart';
import 'dart:math';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapState());

  final TextEditingController searchController = TextEditingController();
  GoogleMapController? mapController;

  Future<void> getMyCurrentLocation() async {
    final position = await LocationHelpers.determinePosition();
    emit(state.copyWith(position: position));
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    final placeMarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    Placemark place = placeMarks[0];
    String address = '${place.street}, ${place.subLocality}, '
        '${place.subAdministrativeArea}, ${place.postalCode}';
    String country = place.country ?? '';
    emit(state.copyWith(currentNamedAddress: address, country: country));
  }

  Future<void> moveToLocation(LatLng latLng) async {
    mapController?.animateCamera(CameraUpdate.newLatLng(latLng));
    emit(state.copyWith(
      confirmedLocation: latLng,
      isLocationSelected: true,
    ));
  }

  void setMapController(GoogleMapController controller) {
    mapController = controller;
  }

  void onCameraIdle(LatLngBounds bounds) {
    emit(state.copyWith(showSearchButton: true));
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}

class PlacesService {
  final Dio _dio = Dio();
  final String _apiKey = 'AIzaSyCzQ_kDgzaCZoSThNJ8I-qJc0fj2yD9TT0';

  Future<List<PlaceDetails>> searchNearbyPlaces({
    required LatLng location,
    String type = 'park',
    int radius = 5000,
    String keyword = 'dog park',
  }) async {
    try {
      print('Searching for parks at ${location.latitude},${location.longitude}');
      final response = await _dio.get(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json',
        queryParameters: {
          'location': '${location.latitude},${location.longitude}',
          'radius': radius,
          'type': type,
          'keyword': keyword,
          'key': _apiKey,
        },
      );

      print('Nearby Search API Response: ${response.data}');

      if (response.data['status'] == 'OK') {
        final results = (response.data['results'] as List)
            .map((place) => PlaceDetails.fromJson({'result': place}))
            .toList();
        print('Found ${results.length} parks');
        return results;
      } else {
        print('API Error: ${response.data['status']}');
        return [];
      }
    } catch (e) {
      print('Error searching nearby places: $e');
      return [];
    }
  }

  Future<PlaceDetails> getPlaceDetails(String placeId) async {
    try {
      final response = await _dio.get(
        'https://maps.googleapis.com/maps/api/place/details/json',
        queryParameters: {
          'place_id': placeId,
          'fields': 'name,formatted_address,geometry,photos,website,opening_hours,reviews,user_ratings_total',
          'key': _apiKey,
        },
      );

      print('Place Details API Response: ${response.data}');
      print('Fetched photos: ${response.data['result']['photos']}');
      print('Fetched formatted_address: ${response.data['result']['formatted_address']}');
      print('Fetched opening_hours: ${response.data['result']['opening_hours']}');
      print('Fetched reviews: ${response.data['result']['reviews']}');
      print('Fetched user_ratings_total: ${response.data['result']['user_ratings_total']}');

      return PlaceDetails.fromJson(response.data);
    } catch (e) {
      print('Error fetching place details: $e');
      return PlaceDetails();
    }
  }

  Future<String?> getPlacePhotoUrl(String? photoReference) async {
    if (photoReference == null) {
      print('Photo reference is null');
      return null;
    }
    try {
      final url = 'https://maps.googleapis.com/maps/api/place/photo?'
          'maxwidth=400&photo_reference=$photoReference&key=$_apiKey';
      print('Generated photo URL: $url');
      // Test the URL by making a HEAD request
      final response = await _dio.head(url);
      if (response.statusCode == 200) {
        print('Photo URL is valid: $url');
        return url;
      } else {
        print('Photo URL failed with status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error getting place photo URL: $e');
      return null;
    }
  }
}

extension MapCubitExtension on MapCubit {
  Future<void> searchDogParks(BuildContext context) async {
    print('Starting dog park search with context: $context');
    if (state.position == null) {
      print('No position available');
      emit(state.copyWith(searchError: 'Current location not available'));
      return;
    }

    emit(state.copyWith(
      isLoadingParks: true,
      searchError: null,
      markers: {}, // Clear all markers to avoid conflicts
    ));

    try {
      final placesService = PlacesService();
      final userLocation = LatLng(
        state.position!.latitude,
        state.position!.longitude,
      );

      final dogParks = await placesService.searchNearbyPlaces(location: userLocation);

      final markers = <Marker>{};

      for (var park in dogParks) {
        if (park.result?.geometry?.location != null) {
          final parkLocation = LatLng(
            park.result!.geometry!.location!.lat!,
            park.result!.geometry!.location!.lng!,
          );

          // Fetch detailed place data
          final placeDetails = await placesService.getPlaceDetails(park.result!.placeId!);

          final markerIcon = await CustomMarker(
            title: park.result?.name ?? 'Dog Park',
            isSafe: true,
            assetName: ImageAssets.parkiPin,
          ).toBitmapDescriptor(
            logicalSize: const Size(150, 150),
            imageSize: const Size(300, 400),
          );

          // Calculate dynamic distance
          final distance = _calculateDistance(userLocation, parkLocation);
          final distanceStr = '${distance.toStringAsFixed(2)}km';
          final timeStr = _estimateTravelTime(distance);

          // Fetch image URLs
          List<String> imageUrls = [];
          if (placeDetails.result?.photos != null && placeDetails.result!.photos!.isNotEmpty) {
            print('Processing ${placeDetails.result!.photos!.length} photos for ${park.result?.name}');
            final photoUrls = await Future.wait(
              placeDetails.result!.photos!.map((photo) async {
                final url = await placesService.getPlacePhotoUrl(photo.photoReference);
                print('Photo URL result for reference ${photo.photoReference}: $url');
                return url;
              }).toList(),
            );
            imageUrls = photoUrls.whereType<String>().toList();
          } else {
            print('No photos found in API response for ${park.result?.name}');
          }

          // Add fallback images if no photos are available
          if (imageUrls.isEmpty) {
            imageUrls = [
              'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
              'https://images.unsplash.com/photo-1518791841217-8f162f1e1131',
              'https://images.unsplash.com/photo-1476673160081-cf065607f449',
            ];
            print('No photos available for ${park.result?.name}, using fallback images: $imageUrls');
          } else {
            print('Fetched image URLs for ${park.result?.name}: $imageUrls');
          }

          markers.add(Marker(
            markerId: MarkerId(park.result?.placeId ?? 'park_${parkLocation.hashCode}'),
            position: parkLocation,
            icon: markerIcon,
            infoWindow: InfoWindow(
              title: park.result?.name ?? 'Dog Park',
              snippet: park.result?.vicinity ?? placeDetails.result?.formattedAddress ?? 'No address available',
            ),
            onTap: () {
              print('Marker tapped for park: ${park.result?.name}, placeId: ${park.result?.placeId}');
              if (park.result?.placeId == null) {
                print('No placeId available for park: ${park.result?.name}');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No details available for this park')),
                );
                return;
              }

              final openingHours = placeDetails.result?.openingHours;
              final isOpenNow = openingHours?.openNow ?? true;
              final duration = openingHours?.weekdayText?.join(', ') ?? '24 hours';

              print('Navigating to CheckInScreen for ${park.result?.name} using navigatorKey');
              navigatorKey.currentState?.pushNamed(
                Routes.checkInRoute,
                arguments: {
                  'parkName': park.result?.name ?? 'Dog Park',
                  'location': placeDetails.result?.formattedAddress ?? 'Unknown Location',
                  'imageUrls': imageUrls,
                  'distance': distanceStr,
                  'time': timeStr,
                  'duration': duration,
                  'isOpenNow': isOpenNow,
                  'rating': placeDetails.result?.rating?.toInt() ?? 5,
                  'ratingCount': placeDetails.result?.userRatingsTotal ?? 12,
                  'reviews': placeDetails.result?.reviews
                          ?.map((review) => {
                                'author_name': review.authorName,
                                'rating': review.rating,
                                'text': review.text,
                                'time': review.relativeTimeDescription,
                              })
                          .toList() ??
                      [],
                },
              )?.catchError((e) {
                print('Navigation error for ${park.result?.name}: $e');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Navigation failed: $e')),
                );
              });
            },
          ));
        }
      }

      emit(state.copyWith(
        markers: markers,
        isLoadingParks: false,
        showSearchButton: false,
      ));

      // Force map refresh
      mapController?.animateCamera(CameraUpdate.newLatLng(userLocation));
    } catch (e) {
      print('Error in dog park search: $e');
      emit(state.copyWith(
        isLoadingParks: false,
        searchError: 'Failed to load dog parks: ${e.toString()}',
      ));
    }
  }

  double _calculateDistance(LatLng start, LatLng end) {
    const double earthRadius = 6371; // km
    final lat1 = start.latitude * pi / 180;
    final lat2 = end.latitude * pi / 180;
    final deltaLat = (end.latitude - start.latitude) * pi / 180;
    final deltaLng = (end.longitude - start.longitude) * pi / 180;

    final a = sin(deltaLat / 2) * sin(deltaLat / 2) +
        cos(lat1) * cos(lat2) * sin(deltaLng / 2) * sin(deltaLng / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  String _estimateTravelTime(double distance) {
    const double speedKmPerMin = 0.5; // Average walking speed, adjust for bus if needed
    final minutes = distance / speedKmPerMin;
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    return '${hours > 0 ? '$hours ' : ''}${mins.toStringAsFixed(0)}m';
  }

  LatLngBounds boundsFromLatLngList(List<LatLng> list) {
    double? x0, x1, y0, y1;
    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1!) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1!) y1 = latLng.longitude;
        if (latLng.longitude < y0!) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(
      northeast: LatLng(x1!, y1!),
      southwest: LatLng(x0!, y0!),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:parki_dog/app/parki_dog.dart';
// import 'package:parki_dog/core/routes/routes_manager.dart';
// import 'package:parki_dog/features/map/data/models/place_details.dart';
// import 'package:parki_dog/features/map/export/map_export.dart';
// import 'package:dio/dio.dart';

// class MapCubit extends Cubit<MapState> {
//   MapCubit() : super(MapState());

//   final TextEditingController searchController = TextEditingController();
//   GoogleMapController? mapController;

//   Future<void> getMyCurrentLocation() async {
//     final position = await LocationHelpers.determinePosition();
//     emit(state.copyWith(position: position));
//   }

//   Future<void> _getAddressFromLatLng(LatLng position) async {
//     final placeMarks = await placemarkFromCoordinates(
//       position.latitude,
//       position.longitude,
//     );
//     Placemark place = placeMarks[0];
//     String address = '${place.street}, ${place.subLocality}, '
//         '${place.subAdministrativeArea}, ${place.postalCode}';
//     String country = place.country ?? '';
//     emit(state.copyWith(currentNamedAddress: address, country: country));
//   }

//   Future<void> moveToLocation(LatLng latLng) async {
//     mapController?.animateCamera(CameraUpdate.newLatLng(latLng));
//     emit(state.copyWith(
//       confirmedLocation: latLng,
//       isLocationSelected: true,
//     ));
//   }

//   void setMapController(GoogleMapController controller) {
//     mapController = controller;
//   }

//   void onCameraIdle(LatLngBounds bounds) {
//     emit(state.copyWith(showSearchButton: true));
//   }

//   @override
//   Future<void> close() {
//     searchController.dispose();
//     return super.close();
//   }
// }

// class PlacesService {
//   final Dio _dio = Dio();
//   final String _apiKey = 'AIzaSyCzQ_kDgzaCZoSThNJ8I-qJc0fj2yD9TT0';

//   Future<List<PlaceDetails>> searchNearbyPlaces({
//     required LatLng location,
//     String type = 'park',
//     int radius = 5000,
//     String keyword = 'dog park',
//   }) async {
//     try {
//       print('Searching for parks at ${location.latitude},${location.longitude}');
//       final response = await _dio.get(
//         'https://maps.googleapis.com/maps/api/place/nearbysearch/json',
//         queryParameters: {
//           'location': '${location.latitude},${location.longitude}',
//           'radius': radius,
//           'type': type,
//           'keyword': keyword,
//           'key': _apiKey,
//         },
//       );

//       print('Nearby Search API Response: ${response.data}');

//       if (response.data['status'] == 'OK') {
//         final results = (response.data['results'] as List)
//             .map((place) => PlaceDetails.fromJson({'result': place}))
//             .toList();
//         print('Found ${results.length} parks');
//         return results;
//       } else {
//         print('API Error: ${response.data['status']}');
//         return [];
//       }
//     } catch (e) {
//       print('Error searching nearby places: $e');
//       return [];
//     }
//   }

//   Future<PlaceDetails> getPlaceDetails(String placeId) async {
//     try {
//       final response = await _dio.get(
//         'https://maps.googleapis.com/maps/api/place/details/json',
//         queryParameters: {
//           'place_id': placeId,
//           'fields': 'name,rating,formatted_address,geometry,photos,website,opening_hours',
//           'key': _apiKey,
//         },
//       );

//       print('Place Details API Response: ${response.data}');

//       return PlaceDetails.fromJson(response.data);
//     } catch (e) {
//       print('Error fetching place details: $e');
//       return PlaceDetails();
//     }
//   }

//   Future<String?> getPlacePhotoUrl(String? photoReference) async {
//     if (photoReference == null) {
//       print('Photo reference is null');
//       return null;
//     }
//     try {
//       return 'https://maps.googleapis.com/maps/api/place/photo?'
//           'maxwidth=400&photo_reference=$photoReference&key=$_apiKey';
//     } catch (e) {
//       print('Error getting place photo URL: $e');
//       return null;
//     }
//   }
// }

// extension MapCubitExtension on MapCubit {
//   Future<void> searchDogParks(BuildContext context) async {
//     print('Starting dog park search with context: $context');
//     if (state.position == null) {
//       print('No position available');
//       emit(state.copyWith(searchError: 'Current location not available'));
//       return;
//     }

//     emit(state.copyWith(
//       isLoadingParks: true,
//       searchError: null,
//       markers: {}, // Clear all markers to avoid conflicts
//     ));

//     try {
//       final placesService = PlacesService();
//       final location = LatLng(
//         state.position!.latitude,
//         state.position!.longitude,
//       );

//       final dogParks = await placesService.searchNearbyPlaces(location: location);

//       final markers = <Marker>{};

//       for (var park in dogParks) {
//         if (park.result?.geometry?.location != null) {
//           final parkLocation = LatLng(
//             park.result!.geometry!.location!.lat!,
//             park.result!.geometry!.location!.lng!,
//           );

//           final markerIcon = await CustomMarker(
//             title: park.result?.name ?? 'Dog Park',
//             isSafe: true,
//             assetName: ImageAssets.parkiPin,
//           ).toBitmapDescriptor(
//             logicalSize: const Size(150, 150),
//             imageSize: const Size(300, 400),
//           );

//           markers.add(Marker(
//             markerId: MarkerId(park.result?.placeId ?? 'park_${parkLocation.hashCode}'),
//             position: parkLocation,
//             icon: markerIcon,
//             infoWindow: InfoWindow(
//               title: park.result?.name ?? 'Dog Park',
//               snippet: park.result?.vicinity ?? park.result?.formattedAddress ?? 'No address available',
//             ),
//             onTap: () {
//               print('Marker tapped for park: ${park.result?.name}, placeId: ${park.result?.placeId}');
//               if (park.result?.placeId == null) {
//                 print('No placeId available for park: ${park.result?.name}');
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('No details available for this park')),
//                 );
//                 return;
//               }

//               print('Navigating to CheckInScreen for ${park.result?.name} using navigatorKey');
//               navigatorKey.currentState?.pushNamed(
//                 Routes.checkInRoute,
//                 arguments: {
//                   'parkName': park.result?.name ?? 'Dog Park',
//                   'location': park.result?.formattedAddress ?? 'Unknown Location',
//                   'imageUrls': park.result?.photos
//                           ?.map((photo) => placesService.getPlacePhotoUrl(photo.photoReference))
//                           .whereType<String>()
//                           .toList() ??
//                       [
//                         'https://plus.unsplash.com/premium_photo-1681558921634-f73645bde42f?...',
//                         'https://plus.unsplash.com/premium_photo-1682960971720-1beb427d524e?...',
//                         'https://plus.unsplash.com/premium_photo-1698368592669-3be6b47d0c34?...',
//                       ],
//                   'distance': '15km',
//                   'time': '17m',
//                   'duration': '24 hours',
//                   'isOpenNow': true,
//                   'rating': park.result?.rating?.toInt() ?? 5,
//                   'ratingCount': park.result?.reviews?.length ?? 12,
//                   'checkInCount': 9,
//                 },
//               )?.catchError((e) {
//                 print('Navigation error for ${park.result?.name}: $e');
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Navigation failed: $e')),
//                 );
//               });
//             },
//           ));
//         }
//       }

//       emit(state.copyWith(
//         markers: markers,
//         isLoadingParks: false,
//         showSearchButton: false,
//       ));

//       // Force map refresh
//       mapController?.animateCamera(CameraUpdate.newLatLng(location));
//     } catch (e) {
//       print('Error in dog park search: $e');
//       emit(state.copyWith(
//         isLoadingParks: false,
//         searchError: 'Failed to load dog parks: ${e.toString()}',
//       ));
//     }
//   }

//   LatLngBounds boundsFromLatLngList(List<LatLng> list) {
//     double? x0, x1, y0, y1;
//     for (LatLng latLng in list) {
//       if (x0 == null) {
//         x0 = x1 = latLng.latitude;
//         y0 = y1 = latLng.longitude;
//       } else {
//         if (latLng.latitude > x1!) x1 = latLng.latitude;
//         if (latLng.latitude < x0) x0 = latLng.latitude;
//         if (latLng.longitude > y1!) y1 = latLng.longitude;
//         if (latLng.longitude < y0!) y0 = latLng.longitude;
//       }
//     }
//     return LatLngBounds(
//       northeast: LatLng(x1!, y1!),
//       southwest: LatLng(x0!, y0!),
//     );
//   }
// }