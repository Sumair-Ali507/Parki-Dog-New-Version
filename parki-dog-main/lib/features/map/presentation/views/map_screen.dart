import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parki_dog/core/routes/routes_manager.dart';
import 'package:parki_dog/features/map/export/map_export.dart';
import '../widgets/map/map_search.dart';
import '../widgets/map/search_this_area.dart';

class MapScreen extends StatelessWidget {
  final bool? isOnlyDetermineLocation;

  const MapScreen({super.key, this.isOnlyDetermineLocation = false});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MapCubit()..getMyCurrentLocation(),
      child: Scaffold(
        body: BlocBuilder<MapCubit, MapState>(
          builder: (mapContext, mapState) {
            final mapCubit = mapContext.read<MapCubit>();

            if (mapState.position == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: false,
                  markers: mapState.markers,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      mapState.position!.latitude,
                      mapState.position!.longitude,
                    ),
                    zoom: 15,
                  ),
                  onMapCreated: (controller) {
                    mapCubit.setMapController(controller);
                  },
                  onTap: (latLang) async {
                    print('Map tapped at $latLang with context: $mapContext');
                    if (isOnlyDetermineLocation ?? false) {
                      mapCubit.moveToLocation(latLang);
                    } else {
                      mapCubit.moveToLocation(latLang);
                      await mapCubit.searchDogParks(mapContext);
                    }
                  },
                  onCameraIdle: () async {
                    final bounds = await mapCubit.mapController?.getVisibleRegion();
                    if (bounds != null) {
                      mapCubit.onCameraIdle(bounds);
                    }
                  },
                ),

                Positioned(
                  top: AppDouble.d16,
                  left: AppDouble.d16,
                  right: AppDouble.d16,
                  child: MapSearch(
                    mapCubit: mapCubit,
                    isOnlyDetermineLocation: isOnlyDetermineLocation,
                    mapState: mapState,
                  ),
                ),

                Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: BlocBuilder<MapCubit, MapState>(
                      buildWhen: (prev, curr) =>
                          prev.showSearchButton != curr.showSearchButton ||
                          prev.isLoadingParks != curr.isLoadingParks,
                      builder: (context, state) {
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: state.showSearchButton
                              ? const DogParkSearchButton()
                              : const SizedBox.shrink(),
                        );
                      },
                    ),
                  ),
                ),

                if (mapState.isLoadingParks)
                  const Center(child: CircularProgressIndicator()),

                if (mapState.searchError != null)
                  Positioned(
                    bottom: 100,
                    left: 20,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        mapState.searchError!,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}