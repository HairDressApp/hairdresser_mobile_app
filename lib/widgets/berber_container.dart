import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';

class BerberContainer extends StatelessWidget {
  const BerberContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Berber Tıklandı");
      },
      child: Container(
        width: 170.w,
        height: 200.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorConstans.feedAppbarColor),
        child: Center(
          child: Text(
            "Berber",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
