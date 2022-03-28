import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/constans/margins.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';
import 'package:hairdresser_mobile_app/routes/routes.dart';

class HairDressWomanContainer extends StatelessWidget {
  const HairDressWomanContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Kadın Kuaför Tıklandı");
        Navigator.of(context).pushNamed(feedPage);
      },
      child: Container(
        width: 170.w,
        height: 400.h,
        margin: MarginConst.leftMargin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorConstans.feedAppbarColor),
        child: Center(
          child: Text(
            "Kadın Kuaför",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
