import 'package:flutter/material.dart';
import 'package:hairdresser_mobile_app/pages/busiess_another_sign_up.dart';
import 'package:hairdresser_mobile_app/pages/business_sign_up.dart';
import 'package:hairdresser_mobile_app/pages/feed.dart';
import 'package:hairdresser_mobile_app/pages/hairdress_select_type.dart';
import 'package:hairdresser_mobile_app/pages/sign_in.dart';
import 'package:hairdresser_mobile_app/pages/sign_up.dart';
import 'package:hairdresser_mobile_app/pages/user_account_info.dart';
import 'package:hairdresser_mobile_app/pages/user_account_setting.dart';
import 'package:hairdresser_mobile_app/pages/user_favorites.dart';
import 'package:hairdresser_mobile_app/pages/user_password_change.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    var businesssignUp = PageStorageKey("business");
    var businessAnother = PageStorageKey("businessAnother");

    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (context) => SignInPage(),
        );
      case signUppages:
        return MaterialPageRoute(
          builder: (context) => SignUpPage(),
        );

      case businessSignUp:
        return MaterialPageRoute(
          builder: (context) => BusinessSignUp(key: businesssignUp),
        );

      case businessAnotherSignUp:
        return MaterialPageRoute(
          builder: (context) => BusinessAnotherSignUp(
            key: businessAnother,
          ),
        );

      case feedPage:
        return MaterialPageRoute(
          builder: (context) => FeedPage(),
        );
      case accountSettings:
        return MaterialPageRoute(
          builder: (context) => UserAccountSetting(),
        );
      case userFavorities:
        return MaterialPageRoute(
          builder: (context) => UserFavorities(),
        );
      case userAccountInfo:
        return MaterialPageRoute(
          builder: (context) => UserAccountInfo(),
        );
      case userPasswordChange:
        return MaterialPageRoute(
          builder: (context) => UserPasswordChange(),
        );
      case hairdressSelectType:
        return MaterialPageRoute(
          builder: (context) => HairDressSelectType(),
        );
    }
  }
}

const String home = "/";
const String signUppages = "/signUp";
const String businessSignUp = "/businessSignUp";
const String businessAnotherSignUp = "/businessAnotherSignUp";
const String feedPage = "/feedPage";
const String accountSettings = "/accountSetting";
const String userFavorities = "/userFavorities";
const String userAccountInfo = "/userAccountInfo";
const String userPasswordChange = "/userPasswordChange";
const String hairdressSelectType = "/hairdressSelectType";
