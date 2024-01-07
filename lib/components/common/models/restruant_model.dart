class Restaurant {
  String? name;
  String? uuid;
  String? phoneNumber;
  String? email;
  Location? location;
  String? imageUrl;

  Restaurant({
    this.name,
    required this.uuid,
    this.phoneNumber,
    this.email,
    this.location,
    this.imageUrl,
  });

  Restaurant.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uuid = json['uuid'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['uuid'] = uuid;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['image_url'] = imageUrl;
    return data;
  }
}

class Location {
  String? address;
  String? city;
  String? state;
  String? pincode;
  num? longitude;
  num? latitude;

  Location({
    this.address,
    this.city,
    this.state,
    this.pincode,
    this.longitude,
    this.latitude,
  });

  Location.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    longitude = json['longitude'];
    latitude = json['latitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['pincode'] = pincode;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }
}