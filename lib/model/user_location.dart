class UserLocation{
  final String city;
  final String state;
  final String country;
  // final String postcode;
  final LocationStreet street;
  final LocationTimeZone timeZone;

  UserLocation({
    required this.city, 
    required this.state, 
    required this.country,
    // required this.postcode,
    required this.street,
    required this.timeZone,
     });

  factory UserLocation.fromMap(Map<String, dynamic> json){
    final street = LocationStreet.fromMap(json);
    final timezone = LocationTimeZone(
      offest: json['timezone']['offset'].toString(),
      description: json['timezone']['description'],
    );
    return UserLocation(
      city: json['city'],
      state: json['state'],
      country: json['country'],
      // postcode: e['loation']['postcode'].toString(),
      street: street,
      timeZone: timezone,
    );
  }
}

class LocationStreet{
  final String latitude;
  final String longitude;

  LocationStreet({required this.latitude, required this.longitude});

  factory LocationStreet.fromMap(Map<String, dynamic> json){

    return LocationStreet(latitude: json['latitude'].toString(), longitude: json['longitude'].toString());
  }
}

class LocationTimeZone{
  final String offest;
  final String description;

  LocationTimeZone({required this.offest, required this.description});
}