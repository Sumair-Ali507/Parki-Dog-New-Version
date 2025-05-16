class PlaceDetails {
  Result? result;

  PlaceDetails({this.result});

  PlaceDetails.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  List<AddressComponents>? addressComponents;
  String? adrAddress;
  String? formattedAddress;
  Geometry? geometry;
  String? icon;
  String? name;
  List<Photos>? photos;
  String? placeId;
  String? reference;
  String? scope;
  List<String>? types;
  String? url;
  int? utcOffset;
  String? vicinity;
  String? website;
  double? rating;
  List<Review>? reviews;
  OpeningHours? openingHours;
  int? userRatingsTotal;

  Result({
    this.addressComponents,
    this.adrAddress,
    this.formattedAddress,
    this.geometry,
    this.icon,
    this.name,
    this.photos,
    this.placeId,
    this.reference,
    this.scope,
    this.types,
    this.url,
    this.utcOffset,
    this.vicinity,
    this.website,
    this.rating,
    this.reviews,
    this.openingHours,
    this.userRatingsTotal,
  });

  Result.fromJson(Map<String, dynamic> json) {
    if (json['address_components'] != null) {
      addressComponents = [];
      json['address_components'].forEach((v) {
        addressComponents!.add(AddressComponents.fromJson(v));
      });
    }
    adrAddress = json['adr_address'];
    formattedAddress = json['formatted_address'];
    geometry = json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
    icon = json['icon'];
    name = json['name'];
    if (json['photos'] != null) {
      photos = [];
      json['photos'].forEach((v) {
        photos!.add(Photos.fromJson(v));
      });
    }
    placeId = json['place_id'];
    reference = json['reference'];
    scope = json['scope'];
    types = (json['types'] as List?)?.whereType<String>().toList();
    url = json['url'];
    utcOffset = json['utc_offset'];
    vicinity = json['vicinity'];
    website = json['website'];
    rating = json['rating'] != null ? json['rating'].toDouble() : null;
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews!.add(Review.fromJson(v));
      });
    }
    openingHours = json['opening_hours'] != null ? OpeningHours.fromJson(json['opening_hours']) : null;
    userRatingsTotal = json['user_ratings_total'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (addressComponents != null) {
      data['address_components'] = addressComponents!.map((v) => v.toJson()).toList();
    }
    data['adr_address'] = adrAddress;
    data['formatted_address'] = formattedAddress;
    if (geometry != null) {
      data['geometry'] = geometry!.toJson();
    }
    data['icon'] = icon;
    data['name'] = name;
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
    data['place_id'] = placeId;
    data['reference'] = reference;
    data['scope'] = scope;
    data['types'] = types;
    data['url'] = url;
    data['utc_offset'] = utcOffset;
    data['vicinity'] = vicinity;
    data['website'] = website;
    data['rating'] = rating;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    if (openingHours != null) {
      data['opening_hours'] = openingHours!.toJson();
    }
    data['user_ratings_total'] = userRatingsTotal;
    return data;
  }
}

class AddressComponents {
  String? longName;
  String? shortName;
  List<String>? types;

  AddressComponents({this.longName, this.shortName, this.types});

  AddressComponents.fromJson(Map<String, dynamic> json) {
    longName = json['long_name'];
    shortName = json['short_name'];
    types = (json['types'] as List?)?.whereType<String>().toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['long_name'] = longName;
    data['short_name'] = shortName;
    data['types'] = types;
    return data;
  }
}

class Geometry {
  Location? location;
  Viewport? viewport;

  Geometry({this.location, this.viewport});

  Geometry.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    viewport = json['viewport'] != null ? Viewport.fromJson(json['viewport']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (viewport != null) {
      data['viewport'] = viewport!.toJson();
    }
    return data;
  }
}

class Location {
  double? lat;
  double? lng;

  Location({this.lat, this.lng});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'] is num ? (json['lat'] as num).toDouble() : null;
    lng = json['lng'] is num ? (json['lng'] as num).toDouble() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class Viewport {
  Location? northeast;
  Location? southwest;

  Viewport({this.northeast, this.southwest});

  Viewport.fromJson(Map<String, dynamic> json) {
    northeast = json['northeast'] != null ? Location.fromJson(json['northeast']) : null;
    southwest = json['southwest'] != null ? Location.fromJson(json['southwest']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (northeast != null) {
      data['northeast'] = northeast!.toJson();
    }
    if (southwest != null) {
      data['southwest'] = southwest!.toJson();
    }
    return data;
  }
}

class Photos {
  int? height;
  List<String>? htmlAttributions;
  String? photoReference;
  int? width;

  Photos({this.height, this.htmlAttributions, this.photoReference, this.width});

  Photos.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    htmlAttributions = (json['html_attributions'] as List?)?.whereType<String>().toList();
    photoReference = json['photo_reference'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['height'] = height;
    data['html_attributions'] = htmlAttributions;
    data['photo_reference'] = photoReference;
    data['width'] = width;
    return data;
  }
}

class Review {
  String? authorName;
  String? text;
  int? rating;
  String? relativeTimeDescription;

  Review({
    this.authorName,
    this.text,
    this.rating,
    this.relativeTimeDescription,
  });

  Review.fromJson(Map<String, dynamic> json) {
    authorName = json['author_name'];
    text = json['text'];
    rating = json['rating'];
    relativeTimeDescription = json['relative_time_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author_name'] = authorName;
    data['text'] = text;
    data['rating'] = rating;
    data['relative_time_description'] = relativeTimeDescription;
    return data;
  }
}

class OpeningHours {
  bool? openNow;
  List<String>? weekdayText;

  OpeningHours({this.openNow, this.weekdayText});

  OpeningHours.fromJson(Map<String, dynamic> json) {
    openNow = json['open_now'];
    weekdayText = (json['weekday_text'] as List?)?.whereType<String>().toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['open_now'] = openNow;
    data['weekday_text'] = weekdayText;
    return data;
  }
}

// class PlaceDetails {
//   Result? result;

//   PlaceDetails({this.result});

//   PlaceDetails.fromJson(Map<String, dynamic> json) {
//     result = json['result'] != null ? Result.fromJson(json['result']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (result != null) {
//       data['result'] = result!.toJson();
//     }
//     return data;
//   }
// }

// class Result {
//   List<AddressComponents>? addressComponents;
//   String? adrAddress;
//   String? formattedAddress;
//   Geometry? geometry;
//   String? icon;
//   String? name;
//   List<Photos>? photos;
//   String? placeId;
//   String? reference;
//   String? scope;
//   List<String>? types;
//   String? url;
//   int? utcOffset;
//   String? vicinity;
//   String? website;
//   double? rating;
//   List<Review>? reviews;
//   OpeningHours? openingHours;

//   Result({
//     this.addressComponents,
//     this.adrAddress,
//     this.formattedAddress,
//     this.geometry,
//     this.icon,
//     this.name,
//     this.photos,
//     this.placeId,
//     this.reference,
//     this.scope,
//     this.types,
//     this.url,
//     this.utcOffset,
//     this.vicinity,
//     this.website,
//     this.rating,
//     this.reviews,
//     this.openingHours,
//   });

//   Result.fromJson(Map<String, dynamic> json) {
//     if (json['address_components'] != null) {
//       addressComponents = [];
//       json['address_components'].forEach((v) {
//         addressComponents!.add(AddressComponents.fromJson(v));
//       });
//     }
//     adrAddress = json['adr_address'];
//     formattedAddress = json['formatted_address'];
//     geometry = json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null;
//     icon = json['icon'];
//     name = json['name'];
//     if (json['photos'] != null) {
//       photos = [];
//       json['photos'].forEach((v) {
//         photos!.add(Photos.fromJson(v));
//       });
//     }
//     placeId = json['place_id'];
//     reference = json['reference'];
//     scope = json['scope'];
//     types = (json['types'] as List?)?.whereType<String>().toList();
//     url = json['url'];
//     utcOffset = json['utc_offset'];
//     vicinity = json['vicinity'];
//     website = json['website'];
//     rating = json['rating'] != null ? json['rating'].toDouble() : null;
//     if (json['reviews'] != null) {
//       reviews = [];
//       json['reviews'].forEach((v) {
//         reviews!.add(Review.fromJson(v));
//       });
//     }
//     openingHours = json['opening_hours'] != null ? OpeningHours.fromJson(json['opening_hours']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (addressComponents != null) {
//       data['address_components'] = addressComponents!.map((v) => v.toJson()).toList();
//     }
//     data['adr_address'] = adrAddress;
//     data['formatted_address'] = formattedAddress;
//     if (geometry != null) {
//       data['geometry'] = geometry!.toJson();
//     }
//     data['icon'] = icon;
//     data['name'] = name;
//     if (photos != null) {
//       data['photos'] = photos!.map((v) => v.toJson()).toList();
//     }
//     data['place_id'] = placeId;
//     data['reference'] = reference;
//     data['scope'] = scope;
//     data['types'] = types;
//     data['url'] = url;
//     data['utc_offset'] = utcOffset;
//     data['vicinity'] = vicinity;
//     data['website'] = website;
//     data['rating'] = rating;
//     if (reviews != null) {
//       data['reviews'] = reviews!.map((v) => v.toJson()).toList();
//     }
//     if (openingHours != null) {
//       data['opening_hours'] = openingHours!.toJson();
//     }
//     return data;
//   }
// }

// class AddressComponents {
//   String? longName;
//   String? shortName;
//   List<String>? types;

//   AddressComponents({this.longName, this.shortName, this.types});

//   AddressComponents.fromJson(Map<String, dynamic> json) {
//     longName = json['long_name'];
//     shortName = json['short_name'];
//     types = (json['types'] as List?)?.whereType<String>().toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['long_name'] = longName;
//     data['short_name'] = shortName;
//     data['types'] = types;
//     return data;
//   }
// }

// class Geometry {
//   Location? location;
//   Viewport? viewport;

//   Geometry({this.location, this.viewport});

//   Geometry.fromJson(Map<String, dynamic> json) {
//     location = json['location'] != null ? Location.fromJson(json['location']) : null;
//     viewport = json['viewport'] != null ? Viewport.fromJson(json['viewport']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (location != null) {
//       data['location'] = location!.toJson();
//     }
//     if (viewport != null) {
//       data['viewport'] = viewport!.toJson();
//     }
//     return data;
//   }
// }

// class Location {
//   double? lat;
//   double? lng;

//   Location({this.lat, this.lng});

//   Location.fromJson(Map<String, dynamic> json) {
//     lat = json['lat'] is num ? (json['lat'] as num).toDouble() : null;
//     lng = json['lng'] is num ? (json['lng'] as num).toDouble() : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['lat'] = lat;
//     data['lng'] = lng;
//     return data;
//   }
// }

// class Viewport {
//   Location? northeast;
//   Location? southwest;

//   Viewport({this.northeast, this.southwest});

//   Viewport.fromJson(Map<String, dynamic> json) {
//     northeast = json['northeast'] != null ? Location.fromJson(json['northeast']) : null;
//     southwest = json['southwest'] != null ? Location.fromJson(json['southwest']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (northeast != null) {
//       data['northeast'] = northeast!.toJson();
//     }
//     if (southwest != null) {
//       data['southwest'] = southwest!.toJson();
//     }
//     return data;
//   }
// }

// class Photos {
//   int? height;
//   List<String>? htmlAttributions;
//   String? photoReference;
//   int? width;

//   Photos({this.height, this.htmlAttributions, this.photoReference, this.width});

//   Photos.fromJson(Map<String, dynamic> json) {
//     height = json['height'];
//     htmlAttributions = (json['html_attributions'] as List?)?.whereType<String>().toList();
//     photoReference = json['photo_reference'];
//     width = json['width'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['height'] = height;
//     data['html_attributions'] = htmlAttributions;
//     data['photo_reference'] = photoReference;
//     data['width'] = width;
//     return data;
//   }
// }

// class Review {
//   String? authorName;
//   String? text;
//   int? rating;

//   Review({this.authorName, this.text, this.rating});

//   Review.fromJson(Map<String, dynamic> json) {
//     authorName = json['author_name'];
//     text = json['text'];
//     rating = json['rating'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['author_name'] = authorName;
//     data['text'] = text;
//     data['rating'] = rating;
//     return data;
//   }
// }

// class OpeningHours {
//   bool? openNow;
//   List<String>? weekdayText;

//   OpeningHours({this.openNow, this.weekdayText});

//   OpeningHours.fromJson(Map<String, dynamic> json) {
//     openNow = json['open_now'];
//     weekdayText = (json['weekday_text'] as List?)?.whereType<String>().toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['open_now'] = openNow;
//     data['weekday_text'] = weekdayText;
//     return data;
//   }
// }
