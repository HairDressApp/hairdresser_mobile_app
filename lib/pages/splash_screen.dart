import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/constans/images.dart';
import 'package:hairdresser_mobile_app/routes/routes.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _animationController.forward();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Future.delayed(Duration(seconds: 4)).then((value) {
          Navigator.of(context).pushNamed(signIn);
        });
      } else {
        if (user.emailVerified) {
          Future.delayed(Duration(seconds: 4)).then((value) {
            Navigator.of(context).pushReplacementNamed(hairdressSelectType);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstans.background,
      body: Center(
        child: Lottie.asset(
          ImageConstance.splashIconAnim,
          height: 150.h,
          controller: _animationController,
          onLoaded: (composed) {
            _animationController.duration = composed.duration;
          },
        ),
      ),
    );
  }
}
