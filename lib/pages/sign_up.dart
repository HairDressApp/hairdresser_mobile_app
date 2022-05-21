import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hairdresser_mobile_app/color_convert/hexcolor.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/constans/key_constans.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';
import 'package:hairdresser_mobile_app/data/firebase_database.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:hairdresser_mobile_app/email_control/email_control.dart';
=======
import 'package:hairdresser_mobile_app/data/localstoragedata.dart';
import 'package:hairdresser_mobile_app/data/sharead_pref.dart';
import 'package:hairdresser_mobile_app/email_control/email_control.dart';
import 'package:hairdresser_mobile_app/main.dart';
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
=======
import 'package:hairdresser_mobile_app/data/localstoragedata.dart';
import 'package:hairdresser_mobile_app/data/sharead_pref.dart';
import 'package:hairdresser_mobile_app/email_control/email_control.dart';
import 'package:hairdresser_mobile_app/main.dart';
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
import 'package:hairdresser_mobile_app/model/user_model.dart';
import 'package:hairdresser_mobile_app/providers/register.dart';
import 'package:hairdresser_mobile_app/routes/routes.dart';
import 'package:hairdresser_mobile_app/toast/show_toast.dart';
import 'package:hairdresser_mobile_app/widgets/register_appbar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late RegisterProvider _registerProvider;
<<<<<<< HEAD
  final _formController = GlobalKey<FormState>(); // TextFormField Kontrol etmek için kullanılan key
  FirebaseDatabase _firebaseAuth = FirebaseDatabase(); // Kayıt Database burada tuttum
=======
  final _formController = GlobalKey<FormState>();

  late SharedPreferences _pref;
  FirebaseDatabase _firebaseAuth = FirebaseDatabase();
<<<<<<< HEAD
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
=======
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
=======

>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
  @override
  Widget build(BuildContext context) {
    _registerProvider = Provider.of<RegisterProvider>(context);
    return Scaffold(
      backgroundColor: ColorConstans.background,
      appBar: PreferredSize(
          child: RegisterAppBar(title: "Yeni Üyelik"),
          preferredSize: Size(double.infinity, 50)),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            _userRegister(), // kayıt formların olduğu UI kısımlar var
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
    // Kayıt formların olduğu UI kısımlar var
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
    // soyadını girecek
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
    // Adını girecek
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
    // Kayıt eden button
    return Container(
      width: 140.w,
      height: 50.h,
      child: ElevatedButton(
<<<<<<< HEAD
<<<<<<< HEAD
        onPressed: () {
            if (_formController.currentState!.validate()) {
=======
=======
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
        onPressed: () async {
          if (_formController.currentState!.validate()) {
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
            _formController.currentState!.save();

            String name = _registerProvider.getName;
            String surname = _registerProvider.getSurname;
            String email = _registerProvider.getEmail;
            String password = _registerProvider.getPasswordAgain;
            UserModel userModel = UserModel(
                name: name, surname: surname, email: email, password: password);
            _firebaseAuth.insert(userModel);
<<<<<<< HEAD
<<<<<<< HEAD
            // _pref.insert(userModel); 

            ToastShow.showToast(context, "Email Onaylama linki gönderildi",
                duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
            Navigator.of(context).pushReplacementNamed(signIn);
=======
=======
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
            // _pref.insert(userModel);

            try {
              _pref = await SharedPreferences.getInstance();
              await _pref.setString(
                  KeyNameCons.EMAIL_KEY, userModel.email.toString());
            } catch (e) {
              print("Hata var");
            }

            ToastShow.showToast(context, "Email Onaylama linki gönderildi",
                duration: Toast.lengthLong,gravity: Toast.bottom);
            Navigator.of(context).pushReplacementNamed(home);
<<<<<<< HEAD
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
=======
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
          }
          if (_registerProvider.getPassword != null &&
              _registerProvider.getPasswordAgain != null) {
            if (!_registerProvider.getPassword
                .toString()
                .contains(_registerProvider.passwordAgain.toString())) {
              ToastShow.showToast(context, "Şifreler Uyumlu değil",
<<<<<<< HEAD
<<<<<<< HEAD
                  duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
=======
                  duration: Toast.lengthLong,gravity: Toast.bottom);
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
=======
                  duration: Toast.lengthLong,gravity: Toast.bottom);
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
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

  _localDB(UserModel model) async {}
}
