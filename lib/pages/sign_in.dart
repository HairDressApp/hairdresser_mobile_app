import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/color_convert/hexcolor.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';
import 'package:hairdresser_mobile_app/data/firebase_database.dart';
import 'package:hairdresser_mobile_app/email_control/email_control.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:hairdresser_mobile_app/model/user_modellogin.dart';
=======
import 'package:hairdresser_mobile_app/model/usermodel_login.dart';
import 'package:hairdresser_mobile_app/providers/locataion.dart';
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
=======
import 'package:hairdresser_mobile_app/model/usermodel_login.dart';
import 'package:hairdresser_mobile_app/providers/locataion.dart';
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
import 'package:hairdresser_mobile_app/providers/login.dart';
import 'package:hairdresser_mobile_app/routes/routes.dart';
import 'package:hairdresser_mobile_app/widgets/business_create_button.dart';
import 'package:hairdresser_mobile_app/widgets/social_login.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  FirebaseDatabase _fireabaseAuth = FirebaseDatabase();
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
=======
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
<<<<<<< HEAD
<<<<<<< HEAD
    
=======
=======
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('email onaylı değil, lütfen onaylayınız');
      } else {
        if(user.emailVerified){
            Navigator.of(context).pushReplacementNamed(hairdressSelectType);
        }
      }
    });
<<<<<<< HEAD
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
=======
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
  }

  final _formController = GlobalKey<FormState>();
  late LoginProvider loginProvider;
  late LocationDataProvier locationProvider;
  @override
  Widget build(BuildContext context) {
    loginProvider = Provider.of<LoginProvider>(context);
    locationProvider = Provider.of<LocationDataProvier>(context, listen: false);

    return Scaffold(
      backgroundColor: ColorConstans.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.h,
              ),
              _textFormFieldSignIn(),
              _forgetPasssword(),
              SizedBox(
                height: 10.h,
              ),
              _loginButton(),
              SizedBox(
                height: 10.h,
              ),
              SocialMediaLogin(),
              SizedBox(
                height: 10.h,
              ),
              _newAccountProfileText(),
              SizedBox(
                height: 40.h,
              ),
              BusinessCreateButton()
            ],
          ),
        ),
      ),
    );
  }

  _textFormFieldSignIn() {
    return Form(
      key: _formController,
      child: Padding(
        padding: PaddingConst.textFormPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              onSaved: (deger) {
                context.read<LoginProvider>().email = deger!;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: "Email Giriniz",
                  prefixIcon: Icon(Icons.email),
                  filled: true,
                  fillColor: ColorConstans.textFormFiel_bg),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Email Boş Kalmamalı";
                } else if (!EmailPattent.isEmail(value)) {
                  return "Email kontrol ediniz";
                }
                return null;
              },
            ),

            SizedBox(
              height: 15.h,
            ),

            // Password
            TextFormField(
              onSaved: (deger) {
                context.read<LoginProvider>().password = deger!;
              },
              obscureText: context.watch<LoginProvider>().getHidePassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: _hidePassword(),
                  fillColor: ColorConstans.textFormFiel_bg,
                  filled: true,
                  hintText: "Şifrenizi Giriniz"),
              validator: (deger) {
                if (deger!.isEmpty) {
                  return "Şifre Boş Kalmamalı";
                } else if (deger.length < 6) {
                  return "Şifre en az 6 karakterli olmalı";
                }

                return null;
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _hidePassword() {
    return IconButton(
        onPressed: () {
          loginProvider.hidePass();
        },
        icon: context.watch<LoginProvider>().getHidePassword
            ? Icon(Icons.visibility_off)
            : Icon(Icons.visibility));
  }

  _forgetPasssword() {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          // Şifremi Unuttum Sayfasına gidecek
<<<<<<< HEAD
<<<<<<< HEAD
          Navigator.of(context).pushNamed(forgotPassword);
=======
           Navigator.of(context).pushNamed(forgotPassword);
  
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
=======
           Navigator.of(context).pushNamed(forgotPassword);
  
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
        },
        child: Container(
            margin: EdgeInsets.only(right: 0.07.sw),
            padding: PaddingConst.sifremiUnuttumPadding,
            child: Text(
              "Şifremi Unuttum",
              style: TextStyle(color: ColorConstans.textColor, fontSize: 16),
            )),
      ),
    );
  }

  _loginButton() {
    return Container(
      width: 140.w,
      height: 50.h,
      child: ElevatedButton(
          onPressed: () {
            if (_formController.currentState!.validate()) {
              _formController.currentState!.save();
              String email = loginProvider.getEmail;
<<<<<<< HEAD
<<<<<<< HEAD
              String password = loginProvider.getPassword;
              UserModelLogin modelLogin =
                  UserModelLogin(email: email, password: password);
              _fireabaseAuth.userLogin(modelLogin, context);
            }
=======
=======
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
            String password = loginProvider.getPassword;
            UserModelLogin modelLogin =
                UserModelLogin(email: email, password: password);
            _fireabaseAuth.userLogin(modelLogin, context);
            }
            
<<<<<<< HEAD
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
=======
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
          },
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              primary: HexColor("#2ECC71")),
          child: Text(
            "Giriş",
            style: TextStyle(fontSize: 16),
          )),
    );
  }

  _newAccountProfileText() {
    return Container(
      padding: PaddingConst.newAccountTextPadding,
      child: InkWell(
        onTap: () {
          // Yeni hesap açma sayfasına gidecek
          Navigator.of(context).pushNamed(signUppages);
        },
        child: Text(
          "Hesabınız yoksa üye olunuz",
          style: TextStyle(fontSize: 18, color: ColorConstans.textColor),
        ),
      ),
    );
  }
}
