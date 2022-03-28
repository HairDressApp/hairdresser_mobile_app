import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  late String email;
  late String password;

  bool hidePassword = true;

  bool get getHidePassword => this.hidePassword;

  set setHidePassword(bool hidePassword) {
    this.hidePassword = hidePassword;
    notifyListeners();
  }

  String get getEmail => this.email;

  set setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  get getPassword => this.password;

  set setPassword(password) {
    this.password = password;
    notifyListeners();
  }

  void hidePass() {
    hidePassword = !hidePassword;
    notifyListeners();
  }
}
