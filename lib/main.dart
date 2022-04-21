import 'package:flutter/material.dart';
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

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
