import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/color_convert/hexcolor.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';
import 'package:hairdresser_mobile_app/email_control/email_control.dart';
import 'package:hairdresser_mobile_app/providers/register.dart';
import 'package:hairdresser_mobile_app/routes/routes.dart';
import 'package:hairdresser_mobile_app/toast/show_toast.dart';
import 'package:hairdresser_mobile_app/widgets/register_appbar.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late RegisterProvider _registerProvider;
  final _formController = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    _registerProvider = Provider.of<RegisterProvider>(context);

    return Scaffold(
      backgroundColor: ColorConstans.background,
      appBar: PreferredSize(child: RegisterAppBar(title: "Yeni Üyelik"), preferredSize: Size(double.infinity,50)),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            _userRegister(),
            SizedBox(
              height: 20.h,
            ),
            _registerButton(context),
          ],
        ),
      )),
    );
  }

  _userRegister() {
    return Form(
        key: _formController,
        child: Padding(
          padding: PaddingConst.textFormPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              textFormName(),
              SizedBox(
                height: 10.h,
              ),
              textFormSurname(),
              SizedBox(
                height: 10.h,
              ),
              textFormEmail(),
              SizedBox(
                height: 10.h,
              ),
              textFormPassword(),
              SizedBox(
                height: 10.h,
              ),
              textFormPasswordAgain()
            ],
          ),
        ));
  }

  TextFormField textFormPasswordAgain() {
    return TextFormField(
      onSaved: (deger) {
        context.read<RegisterProvider>().passwordAgain = deger!;
      },
      obscureText: context.watch<RegisterProvider>().passwordAgainHide,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: "Şifreyi Tekrar Giriniz",
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

  TextFormField textFormPassword() {
    return TextFormField(
      onSaved: (deger) {
        context.read<RegisterProvider>().password = deger!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Şifre Boş Kalmamalı";
        } else if (value.length < 6) {
          return "Şifre en az 6 karakterli olması gerek";
        }
        return null;
      },
      obscureText: context.watch<RegisterProvider>().getPasswordHide,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: "Şifre Giriniz",
          prefixIcon: Icon(Icons.password),
          suffixIcon: _hidePassword()),
    );
  }

  TextFormField textFormEmail() {
    return TextFormField(
      onSaved: (deger) {
        context.read<RegisterProvider>().email = deger!;
      },
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

  TextFormField textFormSurname() {
    return TextFormField(
      onSaved: (deger) {
        context.read<RegisterProvider>().surname = deger!;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          filled: true,
          fillColor: Colors.white,
          hintText: "Soyadınız",
          prefixIcon: Icon(Icons.person)),
      validator: (value) {
        if (value!.isEmpty) {
          return "Soyad kısmı boş kalmamlı";
        }
        return null;
      },
    );
  }

  TextFormField textFormName() {
    return TextFormField(
      onSaved: (deger) {
        context.read<RegisterProvider>().name = deger!;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          filled: true,
          fillColor: Colors.white,
          hintText: "Adınız",
          prefixIcon: Icon(Icons.person)),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ad kısmı boş kalmamlı";
        }
        return null;
      },
    );
  }

  _hidePassword() {
    return IconButton(
        onPressed: () {
          _registerProvider.hidePassword();
        },
        icon: context.watch<RegisterProvider>().getPasswordHide
            ? Icon(Icons.visibility_off)
            : Icon(Icons.visibility));
  }

  _hidePasswordAgain() {
    return IconButton(
        onPressed: () {
          _registerProvider.hidePasswordAgain();
        },
        icon: context.watch<RegisterProvider>().passwordAgainHide
            ? Icon(Icons.visibility_off)
            : Icon(Icons.visibility));
  }

  _registerButton(BuildContext context) {
    return Container(
      width: 140.w,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () {
          if (_formController.currentState!.validate()) {
            _formController.currentState!.save();
          }
         if(_registerProvider.getPassword != null && _registerProvider.getPasswordAgain !=null ){
            if (!_registerProvider.getPassword
              .toString()
              .contains(_registerProvider.passwordAgain.toString())) {
            ToastShow.showToast(context, "Şifreler Uyumlu değil",
                duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
          }
         }
        },
        style: ElevatedButton.styleFrom(
          primary: HexColor("#2ECC71"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          "Kaydol",
          style: TextStyle(fontSize: 16, color: ColorConstans.textColor),
        ),
      ),
    );
  }
}
