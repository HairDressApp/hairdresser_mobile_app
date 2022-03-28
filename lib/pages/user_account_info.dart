import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';
import 'package:hairdresser_mobile_app/widgets/feed_appbar.dart';
import 'package:hairdresser_mobile_app/widgets/sign_out.dart';
import 'package:hairdresser_mobile_app/widgets/under_appbar_divider.dart';

class UserAccountInfo extends StatefulWidget {
  const UserAccountInfo({Key? key}) : super(key: key);

  @override
  State<UserAccountInfo> createState() => _UserAccountInfoState();
}

class _UserAccountInfoState extends State<UserAccountInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstans.feedBackground,
      appBar: PreferredSize(
          child: FeedAppBar(title: "Hesap Bilgileri"),
          preferredSize: Size(double.infinity, 50)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UnderAppbarDivider(),
          SizedBox(
            height: 50.h,
          ),
          _Infos("E-posta adresi", "mustafaozkaya161@gmail.com"),
          SizedBox(
            height: 20.h,
          ),
          _Infos("Adınız", "Mustafa"),
          SizedBox(
            height: 20.h,
          ),
          _Infos("Soyadınız", "Özkaya"),
          SizedBox(
            height: 30.h,
          ),
          SignOut(onTap: () {
            debugPrint("Hesap bilgilerindeki teki sign out çalıştı");
          }),
        ],
      ),
    );
  }

  _Infos(String title, String content) {
    return Padding(
      padding: PaddingConst.userInfomationsPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            content,
            style: TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }
}
