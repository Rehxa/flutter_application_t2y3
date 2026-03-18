import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/model/ride_pref/ride_pref.dart';

abstract class LocationRepository {
  List<Location> get availableLocations;
}
