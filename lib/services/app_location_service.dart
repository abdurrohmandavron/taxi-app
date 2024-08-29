import 'package:geolocator/geolocator.dart';
import '../../data/models/lat_long_model.dart';

abstract class AppLocation {
  Future<AppLatLong> getCurrentLocation();

  Future<bool> requestPermission();

  Future<bool> checkPermission();
}

class LocationService implements AppLocation {
  final defLocation = const MyLocation();

  @override
  Future<AppLatLong> getCurrentLocation() => Geolocator.getCurrentPosition().then((value) => AppLatLong(lat: value.latitude, long: value.longitude)).catchError((_) => defLocation);

  @override
  Future<bool> requestPermission() => Geolocator.requestPermission().then((value) => value == LocationPermission.always || value == LocationPermission.whileInUse).catchError((_) => false);

  @override
  Future<bool> checkPermission() => Geolocator.checkPermission().then((value) => value == LocationPermission.always || value == LocationPermission.whileInUse).catchError((_) => false);
}
