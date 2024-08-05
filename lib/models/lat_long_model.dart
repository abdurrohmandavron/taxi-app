class AppLatLong {
  final double lat;
  final double long;

  const AppLatLong({
    required this.lat,
    required this.long,
  });
}

class MyLocation extends AppLatLong {
  const MyLocation({
    super.lat = 39.397507,
    super.long = 67.307314,
  });
}
