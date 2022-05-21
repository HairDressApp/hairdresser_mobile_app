import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hairdresser_mobile_app/helper/location_helper.dart';
import 'package:hairdresser_mobile_app/providers/locataion.dart';
import 'package:provider/provider.dart';

class LocationPageview extends StatefulWidget {
  // Maps
  const LocationPageview({Key? key}) : super(key: key);

  @override
  State<LocationPageview> createState() => _LocationPageviewState();
}

class _LocationPageviewState extends State<LocationPageview> {
  double lat = 0.0;
  double long = 0.0;
  late LocationDataProvier _proiver;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initLocation();
  }

  initLocation() async {
    try {
      var list = await _adressLatLngConverto() as List<Location>;
      lat = list.first.latitude;
      long = list.first.longitude;
    } catch (e) {
      debugPrint("init yaparken hata oluştur");
    }
  }

  Completer<GoogleMapController> _controller = Completer();

  /* static final CameraPosition _kGooglePlex = CameraPosition(
    //target: LatLng(37.42796133580664, -122.085749655962),
    target: LatLng(LocationHelper.locationList[0].latitue!,
        LocationHelper.locationList[0].longitute!),
    zoom: 13.4746,
  );
*/

  @override
  Widget build(BuildContext context) {
    _proiver = Provider.of<LocationDataProvier>(context, listen: false);
    return Container(
      width: 500.w,
      height: 500.h,
      padding: EdgeInsets.all(30),
      child: GoogleMap(
        cameraTargetBounds: CameraTargetBounds.unbounded,
        trafficEnabled: true,
          
        mapType: MapType.normal,
        markers: {
          _kuaforGoogleMarker(lat, long),
          _userGoogleMarker(),
        },
        initialCameraPosition: CameraPosition(
            target: LatLng(_proiver.latitute()!, _proiver.longitute()!),
            zoom: 13.4746),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          setState(() {});
        },
      ),
    );
  }

  Future<List<Location>> _adressLatLngConverto() async {
    // Kuaförün adresini haritata göstermek için kullanılacak paket

    List<Location> locations = await locationFromAddress(
        "Yeni, 24. Sk. No:1, 15030 Burdur Merkez/Burdur");
    return locations;
  }

  // Kullanıcıyı harita göstermek için kullanılan marker
  Marker _userGoogleMarker() {
    return Marker(
      markerId: const MarkerId("_userGoogleId"),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title: "Benim Konumum"),
      //position: LatLng(lat, long),
      position: LatLng(_proiver.latitute()!, _proiver.longitute()!),
    );
  }

  // Kuaförün adresini haritala belli etmek için kullanılan marker
  Marker _kuaforGoogleMarker(double lat, double long) {
    return Marker(
      markerId: const MarkerId("_kuaforGoogleId"),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title: "Kuafor Konumu"),
      position: LatLng(lat, long),
      /* position: LatLng(LocationHelper.locationList[0].latitue!,
          LocationHelper.locationList[0].longitute!),*/
    );
  }
}
