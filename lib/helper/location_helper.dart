import 'package:hairdresser_mobile_app/model/location_model.dart';

class LocationHelper {
  static List<LocationModal> locationList = [];

  static add(LocationModal locationModal) {
    locationList.insert(0, locationModal);
  }
}