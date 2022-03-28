import 'package:flutter/cupertino.dart';

class RegisterProvider extends ChangeNotifier {
  late String name;
  late String surname;
  late String email;
  String? password;
  String? passwordAgain;

  bool passwordHide = true;
  bool passwordAgainHide = true;

  bool get getPasswordHide => this.passwordHide;

  bool get getPasswordAgainHide => this.passwordAgainHide;

  get getName => this.name;

  set setName(name) {
    this.name = name;
    notifyListeners();
  }

  get getSurname => this.surname;

  set setSurname(surname) {
    this.surname = surname;
    notifyListeners();
  }

  get getEmail => this.email;

  set setEmail(email) {
    this.email = email;
    notifyListeners();
  }

  get getPassword => this.password;

  set setPassword(password) {
    this.password = password;
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
