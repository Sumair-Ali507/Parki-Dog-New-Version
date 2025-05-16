import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:parki_dog/features/map/data/models/place_details.dart';
import 'package:parki_dog/features/map/export/map_export.dart';
import 'package:flutter_google_maps_webservices/places.dart' as gplaces;
import 'package:rxdart/rxdart.dart';

import '../../../data/models/place_type.dart' as gplaces;

class MapSearchAutoCompleteTextField extends StatefulWidget {
  final ItemClick? itemClick;
  final GetPlaceDetailsWithLatLng? getPlaceDetailWithLatLng;
  final bool isLatLngRequired;
  final String googleAPIKey;
  final int debounceTime;
  final List<String>? countries;
  final TextEditingController? textEditingController;
  final ListItemBuilder? itemBuilder;
  final Widget? separatedBuilder;
  final VoidCallback? clearData;
  final BoxDecoration? boxDecoration;
  final bool isCrossBtnShown;
  final bool showError;
  final FocusNode? focusNode;
  final gplaces.PlaceType? placeType;
  final String? language;

  const MapSearchAutoCompleteTextField({
    super.key,
    this.textEditingController,
    required this.googleAPIKey,
    this.debounceTime = 600,
    this.itemClick,
    this.isLatLngRequired = true,
    this.countries = const [],
    this.getPlaceDetailWithLatLng,
    this.itemBuilder,
    this.boxDecoration,
    this.isCrossBtnShown = true,
    this.separatedBuilder,
    this.showError = true,
    this.focusNode,
    this.placeType,
    this.language = 'en',
    this.clearData,
  });

  @override
  State<MapSearchAutoCompleteTextField> createState() =>
      _MapSearchAutoCompleteTextFieldState();
}

class _MapSearchAutoCompleteTextFieldState
    extends State<MapSearchAutoCompleteTextField> {
  final subject = PublishSubject<String>();
  OverlayEntry? _overlayEntry;
  List<Prediction> alPredictions = [];

  TextEditingController controller = TextEditingController();
  final LayerLink _layerLink = LayerLink();
  bool isSearched = false;

  bool isCrossBtn = true;
  late Dio _dio;

  CancelToken? _cancelToken = CancelToken();

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextField(
        controller: widget.textEditingController,
        decoration: InputDecoration(
          suffixIcon: (!widget.isCrossBtnShown)
              ? const SizedBox()
              : isCrossBtn && _showCrossIconWidget()
              ? IconButton(
            onPressed: widget.clearData,
            icon: const Icon(Icons.close),
          )
              : const SizedBox(),
          border: OutlineInputBorder(),
          hintText: 'Search location',
        ),
        onChanged: (string) {
          subject.add(string);
          if (widget.isCrossBtnShown) {
            isCrossBtn = string.isNotEmpty;
            setState(() {});
          }
        },
      ),
    );
  }

  Future<void> getLocation(String text) async {
    String apiURL =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$text&key=${widget.googleAPIKey}&language=${widget.language}";

    if (widget.countries != null) {
      for (int i = 0; i < widget.countries!.length; i++) {
        String country = widget.countries![i];
        if (i == 0) {
          apiURL = "$apiURL&components=country:$country";
        } else {
          apiURL = "$apiURL|country:$country";
        }
      }
    }
    if (widget.placeType != null) {
      apiURL += "&types=${widget.placeType?.apiString}";
    }

    if (_cancelToken?.isCancelled == false) {
      _cancelToken?.cancel();
      _cancelToken = CancelToken();
    }

    try {
      String proxyURL = "https://cors-anywhere.herokuapp.com/";
      String url = kIsWeb ? proxyURL + apiURL : apiURL;

      Response response = await _dio.get(url, cancelToken: _cancelToken);
      if (!mounted) return;
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      Map map = response.data;
      if (map.containsKey("error_message")) {
        throw response.data["error_message"];
      }

      gplaces.PlacesAutocompleteResponse subscriptionResponse =
      gplaces.PlacesAutocompleteResponse.fromJson(response.data);

      if (text.isEmpty) {
        alPredictions.clear();
        _overlayEntry?.remove();
        return;
      }

      isSearched = false;
      alPredictions.clear();
      if (subscriptionResponse.predictions.isNotEmpty &&
          widget.textEditingController!.text.trim().isNotEmpty) {
        alPredictions.addAll(subscriptionResponse.predictions.map((p) => Prediction(
          description: p.description,
          placeId: p.placeId,
          structuredFormatting: p.structuredFormatting != null
              ? StructuredFormatting(
            mainText: p.structuredFormatting!.mainText,
            secondaryText: p.structuredFormatting!.secondaryText,
          )
              : null,
        )));
      }

      _overlayEntry?.remove();
      _overlayEntry = _createOverlayEntry();
      if (_overlayEntry != null) {
        Overlay.of(context).insert(_overlayEntry!);
      }
    } catch (e) {
      print('Error in autocomplete: $e');
      if (widget.showError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _dio = Dio();
    controller = widget.textEditingController ?? controller;
    subject.stream
        .distinct()
        .debounceTime(Duration(milliseconds: widget.debounceTime))
        .listen(getLocation);
  }

  @override
  void dispose() {
    subject.close();
    _cancelToken?.cancel();
    _overlayEntry?.remove();
    if (widget.textEditingController == null) {
      controller.dispose();
    }
    super.dispose();
  }

  OverlayEntry? _createOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return null;

    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    return OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: size.height + offset.dy,
        width: size.width,
        child: CompositedTransformFollower(
          showWhenUnlinked: false,
          link: _layerLink,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: 4,
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: alPredictions.length,
              separatorBuilder: (context, pos) =>
              widget.separatedBuilder ?? const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    var selectedData = alPredictions[index];
                    if (index < alPredictions.length) {
                      widget.itemClick?.call(selectedData);
                      if (widget.isLatLngRequired) {
                        getPlaceDetailsFromPlaceId(selectedData);
                      }
                      removeOverlay();
                    }
                  },
                  child: widget.itemBuilder != null
                      ? widget.itemBuilder!(context, index, alPredictions[index])
                      : ListTile(
                    title: Text(alPredictions[index].description ?? ''),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void removeOverlay() {
    alPredictions.clear();
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {});
  }

  Future<void> getPlaceDetailsFromPlaceId(Prediction prediction) async {
    var url =
        "https://maps.googleapis.com/maps/api/place/details/json?placeid=${prediction.placeId}&key=${widget.googleAPIKey}";
    try {
      Response response = await _dio.get(url);
      PlaceDetails placeDetails = PlaceDetails.fromJson(response.data);

      prediction.lat = placeDetails.result?.geometry?.location?.lat.toString();
      prediction.lng = placeDetails.result?.geometry?.location?.lng.toString();

      widget.getPlaceDetailWithLatLng?.call(prediction);
    } catch (e) {
      print('Error fetching place details: $e');
      if (widget.showError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  void clearData() {
    widget.textEditingController?.clear();
    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    setState(() {
      alPredictions.clear();
      isCrossBtn = false;
    });

    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  bool _showCrossIconWidget() {
    return widget.textEditingController?.text.isNotEmpty ?? false;
  }
}

typedef ItemClick = void Function(Prediction prediction);
typedef GetPlaceDetailsWithLatLng = void Function(Prediction prediction);
typedef ListItemBuilder = Widget Function(
    BuildContext context, int index, Prediction prediction);