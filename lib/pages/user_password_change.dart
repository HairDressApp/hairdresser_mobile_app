import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/color_convert/hexcolor.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';
import 'package:hairdresser_mobile_app/email_control/email_control.dart';
import 'package:hairdresser_mobile_app/providers/user_password_change.dart';
import 'package:hairdresser_mobile_app/widgets/feed_appbar.dart';
import 'package:hairdresser_mobile_app/widgets/under_appbar_divider.dart';
import 'package:provider/provider.dart';

class UserPasswordChange extends StatefulWidget {
  const UserPasswordChange({Key? key}) : super(key: key);

  @override
  State<UserPasswordChange> createState() => _UserPasswordChangeState();
}

class _UserPasswordChangeState extends State<UserPasswordChange> {
  late UserPasswordChangeProvider _passChangeProvider;
  var _formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    _passChangeProvider = Provider.of<UserPasswordChangeProvider>(context);
    return Scaffold(
      backgroundColor: ColorConstans.feedBackground,
      appBar: PreferredSize(
          child: FeedAppBar(title: "Şifre Değiştirme"),
          preferredSize: Size(double.infinity, 50)),
      body: Column(
        children: [
          UnderAppbarDivider(),
          SizedBox(
            height: 50.h,
          ),
          _passwrodChangeForm(),
          SizedBox(
            height: 30.h,
          ),
          _changeButton(),
        ],
      ),
    );
  }

  TextFormField textFormEmail() {
    return TextFormField(
      onSaved: (deger) {},
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: "Email Giriniz",
          prefixIcon: Icon(Icons.email)),
      validator: (value) {
        if (value!.isEmpty) {
          return "Email Boş kalmamlı";
        } else if (!EmailPattent.isEmail(value)) {
          return "Geçersiz Email";
        }
        return null;
      },
    );
  }

  _passwrodChangeForm() {
    return Form(
        key: _formState,
        child: Padding(
          padding: PaddingConst.textFormPadding,
          child: Column(
            children: [
              textFormEmail(),
              SizedBox(
                height: 10.h,
              ),
              textFormPassword(),
              SizedBox(
                height: 10.h,
              ),
              textFormPasswordAgain(),
            ],
          ),
        ));
  }

  TextFormField textFormPassword() {
    return TextFormField(
      onSaved: (deger) {
        _passChangeProvider.setOldPassword = deger;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Şifre Boş Kalmamalı";
        } else if (value.length < 6) {
          return "Şifre en az 6 karakterli olması gerek";
        }
        return null;
      },
      obscureText: _passChangeProvider.hidePassword,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: "Eski Şifrenizi Giriniz",
          prefixIcon: Icon(Icons.password),
          suffixIcon: _hidePassword()),
    );
  }

  TextFormField textFormPasswordAgain() {
    return TextFormField(
      onSaved: (deger) {
        _passChangeProvider.setNewPassword = deger;
      },
      obscureText: _passChangeProvider.hidePasswordAgain,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: "Yeni Şifrenizi Giriniz",
        prefixIcon: Icon(Icons.password),
        suffixIcon: _hidePasswordAgain(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Şifre Boş Kalmamalı";
        } else if (value.length < 6) {
          return "Şifre en az 6 karakterli olması gerek";
        }
        return null;
      },
    );
  }

  _hidePassword() {
    return IconButton(
        onPressed: () {
          _passChangeProvider.hidePass();
        },
        icon: _passChangeProvider.hidePassword
            ? Icon(Icons.visibility_off)
            : Icon(Icons.visibility));
  }

  _hidePasswordAgain() {
    return IconButton(
        onPressed: () {
          _passChangeProvider.hidePassAgain();
        },
        icon: _passChangeProvider.hidePasswordAgain
            ? Icon(Icons.visibility_off)
            : Icon(Icons.visibility));
  }

  _changeButton() {
    return Container(
      width: 140.w,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () {
          if (_formState.currentState!.validate()) {
            _formState.currentState!.save();
          }
        },
        child: Text("Şifre Değiştir"),
        style: ElevatedButton.styleFrom(
            primary: HexColor("#2ECC71"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
      ),
    );
  }
}
