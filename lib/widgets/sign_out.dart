import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/margins.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';
import 'package:hairdresser_mobile_app/constans/text_style.dart';

class SignOut extends StatelessWidget {
  Function onTap;
  SignOut({required this.onTap,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: PaddingConst.feedTextPadding,
        margin: MarginConst.feedAccountSetting,
        child: Row(
          children: [
            Icon(
              Icons.close,
              size: 22,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Oturumu Kapat",
              style: TextStyleCons.feedTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
