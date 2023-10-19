import 'package:geolocator/geolocator.dart';

class Location {
  Future<Map<String, double>> getCurrentLocation() async {
    Position userLocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    return {
      'latitude': userLocation.latitude,
      'longtitude': userLocation.longitude
    };
  }
}
