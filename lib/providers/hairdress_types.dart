import 'package:flutter/cupertino.dart';

class HairDressTypeProvider extends ChangeNotifier {
    // Kuaförün kayıt olacağı tipi. Berber mi , Kadın kuaför mü seçtiği kısım mı buradan kontrol ediyoruz

  String? selectedItem;

  get getSelectedItem => this.selectedItem;

  set setSelectedItem(String? selectedItem) {
    this.selectedItem = selectedItem;
    notifyListeners();
  }
}
