import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnderAppbarDivider extends StatelessWidget {
  const UnderAppbarDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Divider(
        color: Colors.black,
        height: 20.h,
      ),
    );
  }
}

