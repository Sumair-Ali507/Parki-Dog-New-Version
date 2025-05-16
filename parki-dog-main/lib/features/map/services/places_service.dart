import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parki_dog/features/map/data/models/place_details.dart';

class PlacesService {
  final Dio _dio;
  final String apiKey;

  PlacesService({required this.apiKey}) : _dio = Dio();

  Future<List<PlaceDetails>> searchNearbyPlaces({
    required LatLng location,
    String type = 'park',
    int radius = 5000,
    String keyword = 'dog park',
  }) async {
    try {
      final response = await _dio.get(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json',
        queryParameters: {
          'location': '${location.latitude},${location.longitude}',
          'radius': radius,
          'type': type,
          'keyword': keyword,
          'key': apiKey,
        },
      );

      if (response.data['status'] == 'OK') {
        final places = (response.data['results'] as List)
            .map((place) => PlaceDetails.fromJson({'result': place}))
            .toList();
        print('Found ${places.length} nearby places');
        return places;
      } else {
        print('Nearby search error: ${response.data['status']}');
        return [];
      }
    } on DioException catch (e) {
      print('Dio error searching nearby places: ${e.message}');
      return [];
    } catch (e) {
      print('Unexpected error searching nearby places: $e');
      return [];
    }
  }

  Future<PlaceDetails?> getPlaceDetails(String placeId) async {
    try {
      final response = await _dio.get(
        'https://maps.googleapis.com/maps/api/place/details/json',
        queryParameters: {
          'place_id': placeId,
          'fields': 'name,rating,formatted_address,geometry,photos,website,opening_hours,vicinity',
          'key': apiKey,
        },
      );

      if (response.data['status'] == 'OK') {
        return PlaceDetails.fromJson({'result': response.data['result']});
      } else {
        print('Place details error: ${response.data['status']}');
        return null;
      }
    } on DioException catch (e) {
      print('Dio error fetching place details: ${e.message}');
      return null;
    } catch (e) {
      print('Unexpected error fetching place details: $e');
      return null;
    }
  }

  String? getPlacePhotoUrl(String? photoReference) {
    if (photoReference == null) {
      print('Photo reference is null');
      return null;
    }
    try {
      return 'https://maps.googleapis.com/maps/api/place/photo?'
          'maxwidth=400&photo_reference=$photoReference&key=$apiKey';
    } catch (e) {
      print('Error getting place photo URL: $e');
      return null;
    }
  }
}

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:parki_dog/features/map/data/models/place_details.dart';

// class PlacesService {
//   final String apiKey;

//   PlacesService({required this.apiKey});

//   // 1. Search for nearby places (parks)
//   Future<List<PlaceDetails>> searchNearbyPlaces({
//     required LatLng location,
//     String type = 'park',
//     int radius = 5000,
//     String keyword = 'dog park',
//   }) async {
//     final url = Uri.parse(
//       'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
//       'location=${location.latitude},${location.longitude}'
//       '&radius=$radius&type=$type&keyword=$keyword&key=$apiKey',
//     );

//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body);
//       if (json['status'] == 'OK') {
//         final places = (json['results'] as List)
//             .map((place) => PlaceDetails.fromJson({'result': place}))
//             .toList();
//         return places;
//       } else {
//         print('Nearby search error: ${json['status']}');
//       }
//     } else {
//       print('HTTP error: ${response.statusCode}');
//     }

//     return [];
//   }

//   // 2. Get place details for a given placeId
//   Future<PlaceDetails?> getPlaceDetails(String placeId) async {
//     final url = Uri.parse(
//       'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey',
//     );

//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body);
//       if (json['status'] == 'OK') {
//         return PlaceDetails.fromJson(json['result']);
//       } else {
//         print('Place details error: ${json['status']}');
//       }
//     } else {
//       print('HTTP error: ${response.statusCode}');
//     }

//     return null;
//   }
// }
