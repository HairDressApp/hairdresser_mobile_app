import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/color_convert/hexcolor.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';
import 'package:hairdresser_mobile_app/constans/text_style.dart';
import 'package:hairdresser_mobile_app/data/firebase_database.dart';
import 'package:hairdresser_mobile_app/email_control/email_control.dart';
import 'package:hairdresser_mobile_app/toast/show_toast.dart';
import 'package:hairdresser_mobile_app/widgets/register_appbar.dart';
import 'package:toast/toast.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _textEdiiton = TextEditingController();
  FirebaseDatabase _firebase = FirebaseDatabase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstans.background,
      appBar: PreferredSize(
          child: RegisterAppBar(title: "Şifremi Unuttum"),
          preferredSize: Size(double.infinity, 50)),
      body: Container(
        margin: EdgeInsets.only(top: 100.h),
        padding: PaddingConst.newAccountTextPadding,
        child: Column(
          children: [
            Text(
              "Email Adresinize Şifre Sıfırlama Linki Yollanacaktır",
              style: TextStyleCons.forgotPasswordInfoText,
            ),
            SizedBox(
              height: 15.h,
            ),
            _forgorPasswordTextField(context),
            SizedBox(
              height: 20.h,
            ),
            _resetButton(),
          ],
        ),
      ),
    );
  }

  _forgorPasswordTextField(BuildContext context) {
    return Form(
        child: TextFormField(
      controller: _textEdiiton,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: "Email Adresiniz giriniz",
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(Icons.email)),
      validator: (deger) {
        if (deger!.isEmpty) {
          return "Email adresinizi girmelisiniz";
        }
        return null;
      },
    ));
  }

  _resetButton() {
    return Container(
      width: 160.w,
      height: 50.h,
      child: ElevatedButton(
          onPressed: () {
            if (!EmailPattent.isEmail(_textEdiiton.text)) {
              ToastShow.showToast(context, "Geçersiz Email",
<<<<<<< HEAD
                  duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
            } else {
              _firebase.passwordForgot(_textEdiiton.text, context);
              ToastShow.showToast(context, "Email Resetleme Linki Gönderildi",
                  duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
=======
                  duration: Toast.lengthLong,gravity: Toast.bottom);
            } else {
              _firebase.passwordForgot(_textEdiiton.text, context);
              ToastShow.showToast(context, "Email Resetleme Linki Gönderildi",
                  duration: Toast.lengthLong,gravity: Toast.bottom);
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
            }
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              primary: HexColor("#2ECC71")),
          child: Text(
            "Şifreyi Resetle",
            style: TextStyle(fontSize: 16),
          )),
    );
  }
}
