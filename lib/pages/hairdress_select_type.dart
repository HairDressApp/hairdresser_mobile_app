import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/constans/images.dart';
import 'package:hairdresser_mobile_app/constans/margins.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';
import 'package:hairdresser_mobile_app/constans/text_style.dart';
import 'package:hairdresser_mobile_app/routes/routes.dart';
import 'package:hairdresser_mobile_app/widgets/beauty_saloon_container.dart';
import 'package:hairdresser_mobile_app/widgets/berber_container.dart';
import 'package:hairdresser_mobile_app/widgets/hairdress_woman_container.dart';
import 'package:hairdresser_mobile_app/widgets/sign_out.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class HairDressSelectType extends StatelessWidget {
  const HairDressSelectType({Key? key}) : super(key: key);

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
                _welcomeText("Mustafa", context),
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
              PopupMenuItem(child: SignOut(onTap: (){
                _auth.signOut();
                Navigator.of(context).pushReplacementNamed(signIn);
              })),
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
