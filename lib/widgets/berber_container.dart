import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/routes/routes.dart';

class BerberContainer extends StatelessWidget {
  const BerberContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Berber Tıklandı");
<<<<<<< HEAD
        Navigator.of(context).pushNamed(businessProfileDetail); // Silinecek
=======
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
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
