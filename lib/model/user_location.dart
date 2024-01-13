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
}

class LocationStreet{
  final String latitude;
  final String longitude;

  LocationStreet({required this.latitude, required this.longitude});
}

class LocationTimeZone{
  final String offest;
  final String description;

  LocationTimeZone({required this.offest, required this.description});
}