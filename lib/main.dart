import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/pages/sign_in.dart';
import 'package:hairdresser_mobile_app/providers/business_address_text_form.dart';
import 'package:hairdresser_mobile_app/providers/business_image_pick.dart';
import 'package:hairdresser_mobile_app/providers/business_sign_up.dart';
import 'package:hairdresser_mobile_app/providers/favorite_icon.dart';
import 'package:hairdresser_mobile_app/providers/hairdress_transaction.dart';
import 'package:hairdresser_mobile_app/providers/hairdress_transaction_list.dart';
import 'package:hairdresser_mobile_app/providers/hairdress_types.dart';
import 'package:hairdresser_mobile_app/providers/image.pick.dart';
import 'package:hairdresser_mobile_app/providers/login.dart';
import 'package:hairdresser_mobile_app/providers/search_select_sehir.dart';
import 'package:hairdresser_mobile_app/providers/textediting_controller.dart';
import 'package:hairdresser_mobile_app/providers/register.dart';
import 'package:hairdresser_mobile_app/providers/user_favorities.dart';
import 'package:hairdresser_mobile_app/providers/user_password_change.dart';
import 'package:hairdresser_mobile_app/routes/routes.dart';
import 'package:provider/provider.dart';

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
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
     return FutureBuilder(
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
            builder: () {
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
}
