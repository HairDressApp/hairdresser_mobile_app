import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class LocationDataProvier extends ChangeNotifier {
 
 LocationData? _locationData;

  get locationData => this._locationData;

  set locationData(value) {
    this._locationData = value;
    notifyListeners();
  }

  double? latitute() {
    if(_locationData != null){
        return _locationData!.latitude;
    }
  }

  double? longitute() {
    if(_locationData != null){
      return _locationData!.longitude;
    }
  
  }
}
