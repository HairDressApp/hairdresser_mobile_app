import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/constans/images.dart';
import 'package:hairdresser_mobile_app/constans/key_constans.dart';
import 'package:hairdresser_mobile_app/constans/margins.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';
import 'package:hairdresser_mobile_app/constans/text_style.dart';
<<<<<<< HEAD
import 'package:hairdresser_mobile_app/routes/routes.dart';
=======
import 'package:hairdresser_mobile_app/data/sharead_pref.dart';
import 'package:hairdresser_mobile_app/model/user_model.dart';
import 'package:hairdresser_mobile_app/routes/routes.dart';
import 'package:hairdresser_mobile_app/toast/show_toast.dart';
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
import 'package:hairdresser_mobile_app/widgets/beauty_saloon_container.dart';
import 'package:hairdresser_mobile_app/widgets/berber_container.dart';
import 'package:hairdresser_mobile_app/widgets/hairdress_woman_container.dart';
import 'package:hairdresser_mobile_app/widgets/sign_out.dart';
import 'package:shared_preferences/shared_preferences.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

<<<<<<< HEAD
class HairDressSelectType extends StatelessWidget {
=======
class HairDressSelectType extends StatefulWidget {
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
  const HairDressSelectType({Key? key}) : super(key: key);

  @override
  State<HairDressSelectType> createState() => _HairDressSelectTypeState();
}

class _HairDressSelectTypeState extends State<HairDressSelectType> {
  late SharedPrefencesStorage _prefs;
  UserModel? usermodel;
  @override
  void initState() {
    // TODO: implement initState
    _prefs = SharedPrefencesStorage();
    super.initState();
    _prefs.getData().then((value) {
      if (value == null) {
        ToastShow.showToast(context, "SharedPref Boş geldi");
      } else {
        usermodel = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstans.feedBackground,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _welcomeText(
                     _auth.currentUser!.email.toString().substring(0,7),
                    context),
              ],
            ),
            SizedBox(
              height: 100.h,
            ),
            Image.asset(
              ImageConstance.logoImage,
              width: 330.w,
              height: 100.h,
            ),
            SizedBox(
              height: 120.h,
            ),
            containersHairDress()
          ],
        ),
      ),
    );
  }

  Row containersHairDress() {
    return Row(
      children: [
        HairDressWomanContainer(),
        SizedBox(
          width: 10.w,
        ),
        Column(
          children: [
            BerberContainer(),
            SizedBox(
              height: 10.h,
            ),
            BeautySaloon(),
          ],
        )
      ],
    );
  }

  _welcomeText(String user, BuildContext context) {
    return InkWell(
      onTap: () {
        showMenu(
            elevation: 6.0,
            context: context,
            position: RelativeRect.fromLTRB(400.0.w, 90.0.h, 0.0, 0.0),
            items: [
<<<<<<< HEAD
              PopupMenuItem(child: SignOut(onTap: (){
                _auth.signOut();
                Navigator.of(context).pushReplacementNamed(signIn);
              })),
=======
              PopupMenuItem(child: SignOut(onTap: () {_auth.signOut();
              Navigator.of(context).pushReplacementNamed(home);})),
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
            ]);
      },
      child: Container(
        margin: MarginConst.welcomeTextMargin,
        padding: PaddingConst.welcomeTextPadding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Hoşgeldiniz ",
              style: TextStyleCons.feedTextStyle,
            ),
            Text(
              user,
              style: TextStyleCons.welcomeUserNameText,
            ),
          ],
        ),
      ),
    );
  }
}
