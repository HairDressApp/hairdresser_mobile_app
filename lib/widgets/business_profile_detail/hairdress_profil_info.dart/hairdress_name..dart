import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/margins.dart';

class HairDressName extends StatelessWidget {
  const HairDressName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: MarginConst.hairDressInfoMargin,
      child: Text(
        "Arzum Bayan Kuaför",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
