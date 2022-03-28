import 'package:flutter/cupertino.dart';

class HairDressTransactionProvider extends ChangeNotifier {

   // Kuaförde yapılacak işlemleri kontrol etmek için

  String? selectedItem;
  String? price;

  get getPrice => this.price;

  set setPrice(String? price) {
    this.price = price;
    notifyListeners();
  }

  get getSelectedItem => this.selectedItem;

  set setSelectedItem(String? selectedItem) {
    this.selectedItem = selectedItem;
    notifyListeners();
  }
}
