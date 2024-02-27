class Location {
  List<LocationModel>? foundLocationsList;

  Location({this.foundLocationsList});

  Location.fromJson(Map<String, dynamic> json) {
    if (json['foundLocations'] != null) {
      foundLocationsList = <LocationModel>[];
      json['foundLocations'].forEach((v) {
        foundLocationsList!.add(new LocationModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.foundLocationsList != null) {
      data['foundLocations'] =
          this.foundLocationsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LocationModel {
  int? id;
  String? name;
  String? lat;
  String? long;
  String? marker;

  LocationModel({
    this.id,
    this.name,
    this.lat,
    this.long,
    this.marker,
  });

  LocationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lat = json['lat'];
    long = json['long'];
    marker = json['marker'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['marker'] = this.marker;
    return data;
  }
}
