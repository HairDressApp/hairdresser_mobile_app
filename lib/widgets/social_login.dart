import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hairdresser_mobile_app/color_convert/hexcolor.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';
import 'package:hairdresser_mobile_app/providers/login.dart';
import 'package:hairdresser_mobile_app/toast/show_toast.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class SocialMediaLogin extends StatefulWidget {
  const SocialMediaLogin({Key? key}) : super(key: key);

  @override
  State<SocialMediaLogin> createState() => _SocialMediaLoginState();
}

class _SocialMediaLoginState extends State<SocialMediaLogin> {
  late LoginProvider _loginProvider;

  @override
  Widget build(BuildContext context) {
    _loginProvider = Provider.of<LoginProvider>(context);
    return Padding(
      padding: PaddingConst.socialMediaPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _loginWithGoogle(context),
          SizedBox(
            height: 10.h,
          ),
          _loginWithFacebook(context),
        ],
      ),
    );
  }

  _loginWithGoogle(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.h,
      child: ElevatedButton(
          onPressed: () {
            signInWithGoogle().catchError((onError) => ToastShow.showToast(context, onError.toString(),duration: Toast.lengthLong,gravity: Toast.bottom)              
                );
          },
          style: ElevatedButton.styleFrom(
              primary: HexColor("#CE2626"),
              onPrimary: ColorConstans.textColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          child: Text(
            "Google ile Giriş Yap",
            style: TextStyle(fontSize: 16),
          )),
    );
  }

  _loginWithFacebook(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.h,
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              primary: HexColor("#3E67B9"),
              onPrimary: ColorConstans.textColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          child: Text(
            "Facebook ile Giriş Yap",
            style: TextStyle(fontSize: 16),
          )),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // google ile giriş işlemi yapıldı
    try {
      // Kimlik doğrulama akışını tetikliyoruz
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Yetkilendirme ayrıntılarını istekten alıyoruz
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Yeni bir kimlik bilgisi oluşturuyoruz
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Oturum açtıktan sonra, UserCredential'ı iade edin
      return await _auth.signInWithCredential(credential);
    } on PlatformException catch (err) {
      // Handle err
      return Future.error("Hata");
    } catch (e) {
      var googleAuthCredential = GoogleAuthProvider.credential(
          accessToken: GoogleAuthProvider.GOOGLE_SIGN_IN_METHOD);

      try {
        // Kullanıcının Google ile oturum açmasını deneyin
        await _auth.signInWithCredential(googleAuthCredential);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // Hesap zaten farklı bir kimlik bilgisine sahip
          String email = e.email!;
          AuthCredential pendingCredential = e.credential!;

          // Çakışan kullanıcı için hangi oturum açma yöntemlerinin bulunduğunun bir listesini alın
          List<String> userSignInMethods =
              await _auth.fetchSignInMethodsForEmail(email);

          // Kullanıcının birkaç oturum açma yöntemi varsa, listedeki ilk yöntem kullanılması "önerilen" yöntem olacaktır.
          if (userSignInMethods.first == 'password') {
            // Kullanıcıdan şifresini girmesini isteyin
            String password = _loginProvider.getPassword.toString();

            // Kullanıcının hesabında parolayla oturum açın
            UserCredential userCredential =
                await _auth.signInWithEmailAndPassword(
              email: email,
              password: password,
            );

            // Bekleyen kimlik bilgilerini mevcut hesaba bağlayın
            await userCredential.user!.linkWithCredential(pendingCredential);

            // Başarı! Uygulama akışınıza geri dönün
            return goToApplication();
          }

          // Since other providers are now external, you must now sign the user in with another
          // auth provider, such as Facebook.
          if (userSignInMethods.first == 'facebook.com') {
            // Create a new Facebook credential
            String accessToken = await triggerFacebookAuthentication();
            var facebookAuthCredential =
                FacebookAuthProvider.credential(accessToken);

            // Sign the user in with the credential
            UserCredential userCredential =
                await _auth.signInWithCredential(facebookAuthCredential);

            // Link the pending credential with the existing account
            await userCredential.user!.linkWithCredential(pendingCredential);

            // Success! Go back to your application flow
            return goToApplication();
          }

          // Handle other OAuth providers...
        }
      }

      return Future.error("Böyle bir kullanıcı normal hesap olarak kayıtlı");
    }
  }

  Future<UserCredential> goToApplication() {
    // Futuru metod 0 sanıye duraklatıp bitirdik
    return Future.delayed(Duration.zero);
  }

   triggerFacebookAuthentication() {
    // Facebook accesToken yarattık
    return FacebookAuthProvider.FACEBOOK_SIGN_IN_METHOD;
  }

}
