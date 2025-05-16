import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parki_dog/features/map/data/models/place_details.dart';
import 'package:parki_dog/features/map/export/map_export.dart';

class MapState extends Equatable {
  final Position? position;
  final Set<Marker> markers;
  final LatLng? confirmedLocation;
  final bool isLocationSelected;
  final String? currentNamedAddress;
  final String? country;
  final bool isLoadingParks;
  final String? searchError;
  final bool showSearchButton;
  final PlaceDetails? selectedPlaceDetails;

  const MapState({
    this.position,
    this.markers = const {},
    this.confirmedLocation,
    this.isLocationSelected = false,
    this.currentNamedAddress,
    this.country,
    this.isLoadingParks = false,
    this.searchError,
    this.showSearchButton = false,
    this.selectedPlaceDetails,
  });

  MapState copyWith({
    Position? position,
    Set<Marker>? markers,
    LatLng? confirmedLocation,
    bool? isLocationSelected,
    String? currentNamedAddress,
    String? country,
    bool? isLoadingParks,
    String? searchError,
    bool? showSearchButton,
    PlaceDetails? selectedPlaceDetails,
  }) {
    return MapState(
      position: position ?? this.position,
      markers: markers ?? this.markers,
      confirmedLocation: confirmedLocation ?? this.confirmedLocation,
      isLocationSelected: isLocationSelected ?? this.isLocationSelected,
      currentNamedAddress: currentNamedAddress ?? this.currentNamedAddress,
      country: country ?? this.country,
      isLoadingParks: isLoadingParks ?? this.isLoadingParks,
      searchError: searchError ?? this.searchError,
      showSearchButton: showSearchButton ?? this.showSearchButton,
      selectedPlaceDetails: selectedPlaceDetails ?? this.selectedPlaceDetails,
    );
  }

  @override
  List<Object?> get props => [
    position,
    markers,
    confirmedLocation,
    isLocationSelected,
    currentNamedAddress,
    country,
    isLoadingParks,
    searchError,
    showSearchButton,
    selectedPlaceDetails,
  ];
}
