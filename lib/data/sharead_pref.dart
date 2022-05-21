import 'package:flutter/cupertino.dart';
import 'package:hairdresser_mobile_app/constans/key_constans.dart';
import 'package:hairdresser_mobile_app/data/localstoragedata.dart';
import 'package:hairdresser_mobile_app/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefencesStorage extends LocalStorageData {
  

  

  @override
  void insert(UserModel model) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    await _pref.setString(KeyNameCons.NAME_KEY, model.name!);
    await _pref.setString(KeyNameCons.SURNAME_KEY, model.surname!);
    await _pref.setString(KeyNameCons.EMAIL_KEY, model.email!);
    await _pref.setString(KeyNameCons.PASSWORD_KEY, model.password!);
  }


  Future<UserModel> getData() async {
    
    SharedPreferences _pref = await SharedPreferences.getInstance();
   
      String name = _pref.getString(KeyNameCons.NAME_KEY)!;
      String surname = _pref.getString(KeyNameCons.SURNAME_KEY)!;
      String email = _pref.getString(KeyNameCons.EMAIL_KEY)!;
      String password = _pref.getString(KeyNameCons.PASSWORD_KEY)!;
      return UserModel(
          name: name, surname: surname, email: email, password: password);
    
  }
}
