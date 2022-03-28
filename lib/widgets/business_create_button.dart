import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/color_convert/hexcolor.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';
import 'package:hairdresser_mobile_app/routes/routes.dart';

class BusinessCreateButton extends StatelessWidget {
  const BusinessCreateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PaddingConst.businessPadding,
      width: MediaQuery.of(context).size.width,
      height: 80.h,
      child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(businessSignUp);
          },
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            primary: HexColor("#2D2B2B"),
          ),
          child: Text(
            "İşletme Profili Oluştur",
            style: TextStyle(fontSize: 16, color: ColorConstans.textColor),
          )),
    );
  }
}
