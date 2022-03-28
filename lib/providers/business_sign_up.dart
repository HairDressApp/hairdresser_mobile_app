import 'package:flutter/cupertino.dart';

class BusinessSignUpProvider extends ChangeNotifier {
  late String hairDressName;
  late String name;
  late String phoneNumber;
  late String email;
   String? passwords;

 get getPasswords => this.passwords;

  set setPasswords(String passwords) {
    this.passwords = passwords;
    notifyListeners();
  }

 String? passwordAgain;

  // Password Hide

  bool passwordHide = true;
  bool passwordAgainHide = true;

  bool get getPasswordHide => this.passwordHide;

  bool get getPasswordAgainHide => this.passwordAgainHide;

  // Register

  String get getHairDressName => this.hairDressName;

  set setHairDressName(hairDressName) {
    this.hairDressName = hairDressName;
    notifyListeners();
  }

  String get getName => this.name;

  set setName(name) {
    this.name = name;
    notifyListeners();
  }

  String get getPhoneNumber => this.phoneNumber;

  set setPhoneNumber(phoneNumber) {
    this.phoneNumber = phoneNumber;
    notifyListeners();
  }

  String get getEmail => this.email;

  set setEmail(email) {
    this.email = email;
    notifyListeners();
  }

  get getPasswordAgain => this.passwordAgain;

  set setPasswordAgain(passwordAgain) {
    this.passwordAgain = passwordAgain;
    notifyListeners();
  }

  void hidePassword() {
    passwordHide = !passwordHide;
    notifyListeners();
  }

  void hidePasswordAgain() {
    passwordAgainHide = !passwordAgainHide;
    notifyListeners();
  }
}
