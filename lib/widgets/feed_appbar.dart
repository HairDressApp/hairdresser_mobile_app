import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';

class FeedAppBar extends StatelessWidget {
  String title;
  FeedAppBar({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                size: 36,
                color: Colors.black,
              )),
          SizedBox(
            width: 15.h,
          ),
          Center(
              child: Text(
            title,
            style: TextStyle(fontSize: 23, color: ColorConstans.appbarTextColor),
          ))
        ],
      ),
    );
  }
}