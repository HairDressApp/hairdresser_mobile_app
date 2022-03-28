import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/color_convert/hexcolor.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';

class SocialMediaLogin extends StatelessWidget {
  const SocialMediaLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConst.socialMediaPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _loginWithGoogle(context),
          SizedBox(height: 10.h,),
          _loginWithFacebook(context),
        ],
      ),
    );
  }

  _loginWithGoogle(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.h,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              primary: HexColor("#CE2626"),
              onPrimary: ColorConstans.textColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          child: Text(
            "Google ile Giriş Yap",
            style: TextStyle(fontSize: 16),
          )),
    );
  }

  _loginWithFacebook(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.h,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              primary: HexColor("#3E67B9"),
              onPrimary: ColorConstans.textColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          child: Text(
            "Facebook ile Giriş Yap",
            style: TextStyle(fontSize: 16),
          )),
    );
  }
}
