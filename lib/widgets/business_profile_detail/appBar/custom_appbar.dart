import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/appBar/back_icon.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/appBar/favorite_icon.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/appBar/image_pick.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BackIcon(),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ImagePick(),
                SizedBox(width: 10.w,),
                FavoriteIcon(),
                SizedBox(width: 20.w,)
              ],
            ),
          )
        ],
      ),
    );
  }
}