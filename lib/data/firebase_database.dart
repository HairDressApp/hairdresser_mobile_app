import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hairdresser_mobile_app/data/localstoragedata.dart';
<<<<<<< HEAD
import 'package:hairdresser_mobile_app/model/user_model.dart';
import 'package:hairdresser_mobile_app/model/user_modellogin.dart';
import 'package:hairdresser_mobile_app/model/user_modellogin.dart';
=======
import 'package:hairdresser_mobile_app/data/sharead_pref.dart';
import 'package:hairdresser_mobile_app/model/user_model.dart';
import 'package:hairdresser_mobile_app/model/usermodel_login.dart';
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
import 'package:hairdresser_mobile_app/routes/routes.dart';
import 'package:hairdresser_mobile_app/toast/show_toast.dart';
import 'package:toast/toast.dart';

class FirebaseDatabase implements LocalStorageData {
  late FirebaseAuth _firebaseAuth;
  FirebaseDatabase() {
    _init();
  }
  @override
  void insert(UserModel model) async {
    // TODO: implement insert

    try {
<<<<<<< HEAD
      
=======
      SharedPrefencesStorage storage = SharedPrefencesStorage();
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: model.email!, password: model.password!);
      User user = userCredential.user!;
      if (user != null && !user.emailVerified) {
<<<<<<< HEAD
=======
        storage.insert(model);
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
        await user.sendEmailVerification();
        debugPrint("Email Doğrulama Postası Gönderildi.");
        await _firebaseAuth.signOut();
      }
    } catch (e) {
      debugPrint("Girilen Email Kayıtlıdır.");
    }
  }

  _init() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  userLogin(UserModelLogin model, BuildContext context) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
              email: model.email!, password: model.password!);
      User user = userCredential.user!;
      if (user != null && user.emailVerified) {
        Navigator.of(context).pushReplacementNamed(hairdressSelectType);
      } else {
        ToastShow.showToast(
            context, "Emailiniz onaylı değil lütfen onaylayınız",
<<<<<<< HEAD
            duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
=======
            duration: Toast.lengthLong,gravity: Toast.bottom);
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
        await _firebaseAuth.signOut();
      }
    } catch (e) {
      ToastShow.showToast(context, "Geçersiz bilgiler",
<<<<<<< HEAD
          duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
=======
          duration: Toast.lengthLong,gravity: Toast.bottom);
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
    }
  }

  passwordForgot(String email, BuildContext context) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      ToastShow.showToast(context, "Bu email'e kayıtlı kullanıcı yok",
<<<<<<< HEAD
          duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
=======
          duration: Toast.lengthLong,gravity: Toast.bottom);
>>>>>>> 2d74bd0f300de027349fcf490874d4688e6da4c7
    }
  }
}
