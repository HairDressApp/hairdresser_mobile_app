import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/constans/key_constans.dart';
import 'package:hairdresser_mobile_app/constans/margins.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';
import 'package:hairdresser_mobile_app/constans/text_style.dart';
import 'package:hairdresser_mobile_app/routes/routes.dart';
import 'package:hairdresser_mobile_app/widgets/sign_out.dart';
import 'package:shared_preferences/shared_preferences.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

<<<<<<< HEAD
<<<<<<< HEAD
class UserNavigationManu extends StatelessWidget {
=======
class UserNavigationManu extends StatefulWidget {
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
=======
class UserNavigationManu extends StatefulWidget {
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
  const UserNavigationManu({Key? key}) : super(key: key);

  @override
  State<UserNavigationManu> createState() => _UserNavigationManuState();
}

class _UserNavigationManuState extends State<UserNavigationManu> {
  late SharedPreferences _pref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: ColorConstans.feedNavMenu,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150.h,
            ),
            userEmailText(),
            underLineDivider(),
            SizedBox(
              height: 50.h,
            ),
            accountSetting(context),
            SizedBox(
              height: 10.h,
            ),
            myFavorites(context),
            SizedBox(
              height: 10.h,
            ),
            filtreApply(context),
            SizedBox(
              height: 10.h,
            ),
            contactUs(),
            SizedBox(
              height: 10.h,
            ),
            underLineDivider(),
            SizedBox(
              height: 20.h,
            ),
            SignOut(onTap: () {
              _auth.signOut();
<<<<<<< HEAD
<<<<<<< HEAD
              Navigator.of(context).pushReplacementNamed(signIn);
=======
              Navigator.of(context).pushReplacementNamed(home);
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
=======
              Navigator.of(context).pushReplacementNamed(home);
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
            }),
            SizedBox(
              height: 250.h,
            ),
            versionText()
          ],
        ),
      ),
    );
  }

  Align versionText() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        "Versiyon 1.1",
        style: TextStyleCons.feedTextStyle,
      ),
    );
  }

  Container underLineDivider() {
    return Container(
      child: Divider(
        color: Colors.black45,
        height: 20.h,
      ),
    );
  }

  Padding userEmailText() {
    return Padding(
      padding: const EdgeInsets.only(right: 40, left: 10),
      child: Text(
        "mustafaozkaya161@gmail.com",
        style: TextStyleCons.feedTextStyle,
      ),
    );
  }

  accountSetting(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).popAndPushNamed(accountSettings);
      },
      child: Container(
        padding: PaddingConst.feedTextPadding,
        margin: MarginConst.feedAccountSetting,
        child: Row(
          children: [
            Icon(
              Icons.settings,
              size: 22,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Hesap Ayarları",
              style: TextStyleCons.feedTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  myFavorites(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).popAndPushNamed(userFavorities);
      },
      child: Container(
        padding: PaddingConst.feedTextPadding,
        margin: MarginConst.feedAccountSetting,
        child: Row(
          children: [
            Icon(
              Icons.favorite,
              size: 22,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Favorilerim",
              style: TextStyleCons.feedTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  contactUs() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: PaddingConst.feedTextPadding,
        margin: MarginConst.feedAccountSetting,
        child: Row(
          children: [
            Icon(
              Icons.contact_support,
              size: 22,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Bize Ulaşın",
              style: TextStyleCons.feedTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  filtreApply(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(deepAr);
      },
      child: Container(
        padding: PaddingConst.feedTextPadding,
        margin: MarginConst.feedAccountSetting,
        child: Row(
          children: [
            Icon(
              Icons.face,
              size: 22,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Filtre Uygula",
              style: TextStyleCons.feedTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  _localInit() async {
    await SharedPreferences.getInstance();
  }
}
