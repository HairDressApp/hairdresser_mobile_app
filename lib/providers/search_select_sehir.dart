import 'package:flutter/cupertino.dart';

class SearchSelectSehirProvider extends ChangeNotifier {
  String? _selectSehir = "";

  get selectSehir => this._selectSehir;

  set selectSehir(value) {
    this._selectSehir = value;
    notifyListeners();
  }

  String? filtrelenen_kelime = "";

  get filtrelenenkelime => this.filtrelenen_kelime;

  set filtrelenenkelime(value) {
    this.filtrelenen_kelime = value;
    notifyListeners();
  }

  String? seciliOlan;

  get getSeciliOlan => this.seciliOlan;

  set setSeciliOlan(seciliOlan) {
    this.seciliOlan = seciliOlan;
    notifyListeners();
  }




}
