import 'package:parki_dog/features/map/export/map_export.dart';
import 'package:parki_dog/features/map/presentation/views/check_in_screen.dart';

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
            MapCubit mapCubit = mapContext.read<MapCubit>();
            if (mapState.position == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return Stack(
              children: [
                GoogleMap(
                  mapType: MapType.hybrid,
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: false,
                  markers: mapState.markers,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(mapState.position!.latitude,
                        mapState.position!.longitude),
                    zoom: 15,
                  ),
                  onMapCreated: (GoogleMapController controller) {
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
                ),
                MapSearch(
                  mapCubit: mapCubit,
                  isOnlyDetermineLocation: isOnlyDetermineLocation,
                  mapState: mapState,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class MapSearch extends StatelessWidget {
  const MapSearch({
    super.key,
    required this.mapCubit,
    required this.isOnlyDetermineLocation,
    required this.mapState,
  });

  final MapCubit mapCubit;
  final bool? isOnlyDetermineLocation;
  final MapState mapState;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppDouble.d16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: ColorsManager.navyBlueDark
                              .withOpacity(AppDouble.d0_05),
                          blurRadius: AppDouble.d2,
                          offset: const Offset(AppDouble.d0, AppDouble.d1),
                        ),
                      ],
                    ),
                    child: MapSearchAutoCompleteTextField(
                      textEditingController: mapCubit.searchController,
                      boxDecoration: BoxDecoration(
                        color: ColorsManager.white,
                        borderRadius: BorderRadius.circular(AppDouble.d8),
                      ),
                      googleAPIKey: "AIzaSyCzQ_kDgzaCZoSThNJ8I-qJc0fj2yD9TT0",
                      debounceTime: 500,
                      isLatLngRequired: true,
                      getPlaceDetailWithLatLng: (Prediction prediction) {
                        final latLng = LatLng(
                          prediction.lat.parseToDouble(),
                          prediction.lng.parseToDouble(),
                        );
                        mapCubit.moveToLocation(latLng);
                        if (!(isOnlyDetermineLocation ?? false)) {
                          print('Search triggered from autocomplete with context: $context');
                          mapCubit.searchDogParks(context);
                        }
                      },
                      itemClick: (Prediction prediction) {
                        mapCubit.searchController.text =
                            prediction.description ?? "";
                        mapCubit.searchController.selection =
                            TextSelection.fromPosition(
                          TextPosition(
                            offset: prediction.description?.length ?? 0,
                          ),
                        );
                      },
                      itemBuilder: (context, index, Prediction prediction) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              const Icon(Icons.location_on),
                              const SizedBox(width: 7),
                              Expanded(
                                child: Text(prediction.description ?? ""),
                              ),
                            ],
                          ),
                        );
                      },
                      separatedBuilder: const Divider(),
                      isCrossBtnShown: true,
                      placeType: PlaceType.geocode,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                if (isOnlyDetermineLocation == true &&
                    mapState.isLocationSelected) ...[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, {
                        'latLng': mapState.confirmedLocation,
                        'country': mapState.country,
                        "namedAddress": mapState.currentNamedAddress,
                      });
                    },
                    child: const Text(LocaleKeys.dogOwner_confirm).tr(),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}