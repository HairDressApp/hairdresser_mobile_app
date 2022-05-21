import 'package:firebase_core/firebase_core.dart';
<<<<<<< HEAD
=======
import 'package:flutter/foundation.dart';
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hairdresser_mobile_app/data/firebase_database.dart';
import 'package:hairdresser_mobile_app/data/localstoragedata.dart';
import 'package:hairdresser_mobile_app/data/sharead_pref.dart';
import 'package:hairdresser_mobile_app/helper/location_helper.dart';
import 'package:hairdresser_mobile_app/model/location_model.dart';
import 'package:hairdresser_mobile_app/pages/sign_in.dart';
import 'package:hairdresser_mobile_app/providers/business_address_text_form.dart';
import 'package:hairdresser_mobile_app/providers/business_image_pick.dart';
import 'package:hairdresser_mobile_app/providers/business_sign_up.dart';
import 'package:hairdresser_mobile_app/providers/favorite_icon.dart';
import 'package:hairdresser_mobile_app/providers/hairdress_transaction.dart';
import 'package:hairdresser_mobile_app/providers/hairdress_transaction_list.dart';
import 'package:hairdresser_mobile_app/providers/hairdress_types.dart';
import 'package:hairdresser_mobile_app/providers/image.pick.dart';
import 'package:hairdresser_mobile_app/providers/locataion.dart';
//import 'package:hairdresser_mobile_app/providers/locataion.dart';
import 'package:hairdresser_mobile_app/providers/login.dart';
import 'package:hairdresser_mobile_app/providers/search_select_sehir.dart';
import 'package:hairdresser_mobile_app/providers/textediting_controller.dart';
import 'package:hairdresser_mobile_app/providers/register.dart';
import 'package:hairdresser_mobile_app/providers/user_favorities.dart';
import 'package:hairdresser_mobile_app/providers/user_password_change.dart';
import 'package:hairdresser_mobile_app/routes/routes.dart';
import 'package:location/location.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

<<<<<<< HEAD
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // setup();
  //if (defaultTargetPlatform == TargetPlatform.android) {
   // AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
 // }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]) // Uygulamayı sadece dikey olarak çalıştıyor.
      .then((value) => runApp(MyApp()));
=======
//import 'package:geocoding/geocoding.dart';
//import 'package:geolocator/geolocator.dart';

GetIt getIt = GetIt.instance;
void setup() {
  getIt.registerSingleton<LocalStorageData>(SharedPrefencesStorage(),
      instanceName: "v1");

  getIt.registerSingleton<LocalStorageData>(FirebaseDatabase(),
      instanceName: "v2");

// Alternatively you could write it if you don't like global variables
  //getIt.registerLazySingleton<LocalStorageData>(() => FirebaseDatabase());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // setup();
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]) // Uygulamayı sadece dikey olarak çalıştıyor.
      .then((value) => runApp(ChangeNotifierProvider(
          create: (_) => LocationDataProvier(), child: MyApp())));
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
<<<<<<< HEAD
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
     return FutureBuilder(
=======
  late LocationDataProvier _locationProvider;
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _locationPermissionController();
  }

  @override
  Widget build(BuildContext context) {
    _locationProvider =
        Provider.of<LocationDataProvier>(context, listen: false);
    return FutureBuilder(
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text(snapshot.error.toString())),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          // Eğer bağlantı başarılı ise
          return ScreenUtilInit(
            //  i make this desing in this size
            // Farklı ekranlarda da düzenli durması için
            designSize: Size(393,
                851), // tasarım yapılacak sayfanın boyutu verip bu boyuta göre işlem yapıyoruz
            minTextAdapt: true,
            splitScreenMode: true,
<<<<<<< HEAD
            builder: () {
=======
            builder: (context,child) {
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
              return MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                      create: (context) => LoginProvider(), lazy: true),
                  ChangeNotifierProvider(
                    create: (context) => RegisterProvider(),
                    lazy: true,
                  ),
                  ChangeNotifierProvider(
                    create: (context) => BusinessSignUpProvider(),
                    lazy: true,
                  ),
                  ChangeNotifierProvider(
                    create: (context) => ImagePickProvider(),
                  ),
                  ChangeNotifierProvider(
                    create: (context) => HairDressTypeProvider(),
                  ),
                  ChangeNotifierProvider(
                    create: (context) => HairDressOpenAndCloseTimeProider(),
                  ),
                  ChangeNotifierProvider(
                    create: (context) => HairDressTransactionProvider(),
                  ),
                  ChangeNotifierProvider(
                    create: (context) => HairDressTransactionListProvider(),
                    lazy: true,
                  ),
                  ChangeNotifierProvider(
                    create: (context) => BusinessAddressTextFormProvider(),
                  ),
                  ChangeNotifierProvider(
                    create: (context) => SearchSelectSehirProvider(),
                  ),
                  ChangeNotifierProvider(
                    create: (context) => UserFavoritiesProvider(),
                  ),
                  ChangeNotifierProvider(
                    create: (context) => UserPasswordChangeProvider(),
                  ),
                  ChangeNotifierProvider(
                    create: (context) => FavoriteIconProvider(),
                  ),
                  ChangeNotifierProvider(
                    create: (context) => BusinessImagePickProvider(),
                  ),
                ],
                child: MaterialApp(
                  title: 'HairDresser Mobile App',
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: Routes.generateRoute,
                ),
              );
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

  _locationPermissionController() async {
    // Locationın İzni olup olmadığı kontrol eden metot

    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    var currentLocation = await location.getLocation();
    location.onLocationChanged.listen((event) async {
      currentLocation = event;
      _locationProvider.locationData = event;
    });

    LocationModal _modal = LocationModal();
    _modal.latitue = _locationProvider.latitute();
    _modal.longitute = _locationProvider.longitute();
    LocationHelper.add(_modal);
  }

  /*_getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error("Location not available");
      }
    }

    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation,
            forceAndroidLocationManager: true)
        .then((Position position) {
      _currentPosition = position;
      debugPrint("A: " + _currentPosition.latitude.toString());
      context.read<LocationDataProvier>().locationData = position;
    }).catchError((e) {
      print(e);
    });
  }*/

}
