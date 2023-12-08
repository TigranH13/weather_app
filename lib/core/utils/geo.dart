import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

abstract class GeoUtil {
  static Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placeMark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    String? city = placeMark[0].administrativeArea;

    return city ?? '';
  }
}
