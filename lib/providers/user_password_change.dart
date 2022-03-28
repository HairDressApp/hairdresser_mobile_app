import 'package:flutter/cupertino.dart';

class UserPasswordChangeProvider extends ChangeNotifier {
  String? email;
  String? oldPassword;
  String? newPassword;

  bool _hidePassword = true;
  bool _hidePasswordAgain = true;

  get hidePassword => this._hidePassword;

  get hidePasswordAgain => this._hidePasswordAgain;

  get getEmail => this.email;

  set setEmail(email) {
    this.email = email;
    notifyListeners();
  }

  get getOldPassword => this.oldPassword;

  set setOldPassword(oldPassword) {
    this.oldPassword = oldPassword;
    notifyListeners();
  }

  get getNewPassword => this.newPassword;

  set setNewPassword(newPassword) {
    this.newPassword = newPassword;
    notifyListeners();
  }

  void hidePass() {
    _hidePassword = !_hidePassword;
    notifyListeners();
  }

  void hidePassAgain() {
    _hidePasswordAgain = !_hidePasswordAgain;
    notifyListeners();
  }
}
