import 'package:firebase_auth/firebase_auth.dart';
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

FirebaseAuth _auth = FirebaseAuth.instance;

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
          deleteAccount(context),
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

  deleteAccount(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return _alertUserDeleteDialog(context);
            });
      },
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

  AlertDialog _alertUserDeleteDialog(BuildContext context) {
    return AlertDialog(
              content: Text("Hesap Tamamen Silinecek"),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple
                  ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("HAYIR")),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple
                  ),
                    onPressed: () {
                      // Kullanıcıyı simek için
                      var user = _auth.currentUser;
                     // user!.delete().then((value) {
                        // Sildikten sonra ne yapacak onu buraya yazacağız
                     // }).catchError((onError) {
                        // hata olursa da hatayı burada yakalacağız
                     // });
                    },
                    child: Text("EVET")),
              ],
              title: Text("Hesap Silme"),
            );
  }
}
