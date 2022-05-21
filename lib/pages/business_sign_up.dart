import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/color_convert/hexcolor.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';
import 'package:hairdresser_mobile_app/email_control/email_control.dart';
import 'package:hairdresser_mobile_app/phone_control/phone_control.dart';
import 'package:hairdresser_mobile_app/providers/business_sign_up.dart';
import 'package:hairdresser_mobile_app/routes/routes.dart';
import 'package:hairdresser_mobile_app/toast/show_toast.dart';
import 'package:hairdresser_mobile_app/widgets/register_appbar.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class BusinessSignUp extends StatefulWidget {
  const BusinessSignUp({Key? key}) : super(key: key);

  @override
  State<BusinessSignUp> createState() => _BusinessSignUpState();
}

class _BusinessSignUpState extends State<BusinessSignUp> {
  var _formController = GlobalKey<FormState>();
  late BusinessSignUpProvider _businessProvider;
  @override
  Widget build(BuildContext context) {
    _businessProvider = Provider.of<BusinessSignUpProvider>(context);

    return Scaffold(
      backgroundColor: ColorConstans.background,
      appBar: PreferredSize(
          child: RegisterAppBar(title: "Kuaför İşletme Oluşturma"),
          preferredSize: Size(double.infinity, 50)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _textFormsRegister(),
              _anotherRegisterPageButton(
                  context), // Diğer kayıt özellikleri almak için diğer sayfaya geçiş yaptırıyoruz.
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _textFormsRegister() {
    return Padding(
      padding: PaddingConst.businessPadding,
      child: Form(
          key: _formController,
          child: Column(
            children: [
              SizedBox(
                height: 80.h,
              ),
              hairdressName(),
              SizedBox(
                height: 10.h,
              ),
              hairdressUserName(),
              SizedBox(
                height: 10.h,
              ),
              businessPhoneNumber(),
              SizedBox(
                height: 10.h,
              ),
              businessEmail(),
              SizedBox(
                height: 10.h,
              ),
              textFormPassword(),
              SizedBox(
                height: 10.h,
              ),
              textFormPasswordAgain(),
              SizedBox(
                height: 20.h,
              ),
            ],
          )),
    );
  }

  InternationalPhoneNumberInput businessPhoneNumber() {
    return InternationalPhoneNumberInput(
      onInputChanged: (value) {},
      onSaved: (deger) {
        _businessProvider.setPhoneNumber = deger;
      },
      countries: ["TR"],
      inputBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      inputDecoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        hintText: "Telefon Numaranızı Giriniz",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Telefon numarası boş kalmamalı";
        } else if (value.isNotEmpty) {
          if (value.startsWith("0")) {
            return "Telefon numarası başında '0' olmadan yazınız";
          }
        }
        if (!PhoneControl.isPhoneNoValid(value)) {
          return "Telefon Geçersiz";
        }
        return null;
      },
    );
  }

  TextFormField hairdressName() {
    return TextFormField(
      onSaved: (deger) {
        _businessProvider.setHairDressName = deger;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.add_business),
        hintText: "Kuaför İsmini Giriniz",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Kuaoför ismini lütfen giriniz";
        }
        return null;
      },
    );
  }

  TextFormField hairdressUserName() {
    return TextFormField(
      onSaved: (deger) {
        _businessProvider.setName = deger;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.person),
        hintText: "Adınız Soyadınız ",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Adınız Soyadınız boş kalmamalı";
        }
        return null;
      },
    );
  }

  TextFormField businessEmail() {
    return TextFormField(
      onSaved: (deger) {
        _businessProvider.setEmail = deger;
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

  _hidePassword() {
    return IconButton(
        onPressed: () {
          _businessProvider.hidePassword();
        },
        icon: context.watch<BusinessSignUpProvider>().passwordHide
            ? Icon(Icons.visibility_off)
            : Icon(Icons.visibility));
  }

  _hidePasswordAgain() {
    return IconButton(
        onPressed: () {
          _businessProvider.hidePasswordAgain();
        },
        icon: context.watch<BusinessSignUpProvider>().getPasswordAgainHide
            ? Icon(Icons.visibility_off)
            : Icon(Icons.visibility));
  }

  _anotherRegisterPageButton(BuildContext context) {
    return Container(
      width: 130.w,
      height: 60.h,
      child: ElevatedButton(
        onPressed: () {
          if (_formController.currentState!.validate()) {
            _formController.currentState!.save();
          }
          if (_businessProvider.getPasswords != null &&
              _businessProvider.getPasswordAgain) {
            if (_businessProvider.getPasswords
                .toString()
                .contains(_businessProvider.getPasswordAgain.toString())) {
              ToastShow.showToast(context, "Şifreler Uyumlu değil",
                  duration: Toast.lengthLong,gravity: Toast.bottom);
            }
          }
                      Navigator.of(context).pushNamed(businessAnotherSignUp); 

        },
        child: Icon(
          Icons.arrow_forward_rounded,
          size: 48,
        ),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            primary: HexColor("#2ECC71")),
      ),
    );
  }

  textFormPassword() {
    return TextFormField(
      onSaved: (deger) {
        context.read<BusinessSignUpProvider>().setPasswords = deger!;
      },
      obscureText: context.read<BusinessSignUpProvider>().getPasswordHide,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        filled: true,
        fillColor: Colors.white,
        hintText: "Şifre Giriniz",
        prefixIcon: Icon(Icons.password),
        suffixIcon: _hidePassword(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Şifre boş kalmamalı";
        } else if (value.length < 6) {
          return "Şifre en az 6 karaterli olması gerek";
        }
        return null;
      },
    );
  }

  textFormPasswordAgain() {
    return TextFormField(
      onSaved: (deger) {
        context.read<BusinessSignUpProvider>().setPasswordAgain = deger!;
      },
      obscureText: context.watch<BusinessSignUpProvider>().getPasswordAgainHide,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        fillColor: Colors.white,
        filled: true,
        hintText: "Şifreyi Tekrar Giriniz",
        prefixIcon: Icon(Icons.password),
        suffixIcon: _hidePasswordAgain(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Şifre Tekrarı boş kalmamalı";
        } else if (value.length < 6) {
          return "Şifre en az 6 karaterli olması gerek";
        }
      },
    );
  }
}
