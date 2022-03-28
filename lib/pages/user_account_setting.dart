import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/constans/margins.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';
import 'package:hairdresser_mobile_app/constans/text_style.dart';
import 'package:hairdresser_mobile_app/routes/routes.dart';
import 'package:hairdresser_mobile_app/widgets/feed_appbar.dart';
import 'package:hairdresser_mobile_app/widgets/register_appbar.dart';
import 'package:hairdresser_mobile_app/widgets/under_appbar_divider.dart';

class UserAccountSetting extends StatelessWidget {
  const UserAccountSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstans.feedBackground,
      appBar: PreferredSize(
          child: FeedAppBar(title: "Hesap Ayarları"),
          preferredSize: Size(double.infinity, 50)),
      body: Column(
        children: [
          UnderAppbarDivider(),
          SizedBox(
            height: 50.h,
          ),
          accountInfo(context),
          SizedBox(
            height: 20.h,
          ),
          changePassword(context),
          SizedBox(
            height: 20.h,
          ),
          deleteAccount(),
        ],
      ),
    );
  }

  accountInfo(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(userAccountInfo);
      },
      child: Container(
        margin: MarginConst.feedAccountSetting,
        padding: PaddingConst.feedTextPadding,
        child: Row(
          children: [
            Icon(
              Icons.person,
              size: 22,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Hesap Bilgilerim",
              style: TextStyleCons.feedTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  changePassword(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(userPasswordChange);
      },
      child: Container(
        margin: MarginConst.feedAccountSetting,
        padding: PaddingConst.feedTextPadding,
        child: Row(
          children: [
            Icon(
              Icons.key,
              size: 22,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Şifre Değiştir",
              style: TextStyleCons.feedTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  deleteAccount() {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: MarginConst.feedAccountSetting,
        padding: PaddingConst.feedTextPadding,
        child: Row(
          children: [
            Icon(
              Icons.delete,
              size: 22,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "Hesabı devre dışı bırak",
              style: TextStyleCons.feedTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
