import 'package:flutter/cupertino.dart';
import 'package:hairdresser_mobile_app/model/hairdress_transaction.dart';

class HairDressTransactionListProvider extends ChangeNotifier {

    // Kuaförde işlmeleri ekle butonuna bastığında listeye atmasını sağlayan kısım

  List<HairDressTransactionModel> _listModel = [];

  void add(HairDressTransactionModel transaction) {
    _listModel.add(transaction);
    notifyListeners();
  }

  void remove(int index) {
    _listModel.removeAt(index);
    notifyListeners();
  }

  List<HairDressTransactionModel> getTransaction() {
    return _listModel;
  }
}
