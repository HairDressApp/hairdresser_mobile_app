import 'package:flutter/cupertino.dart';
import 'package:hairdresser_mobile_app/model/hairdress_listview_model.dart';

class UserFavoritiesProvider extends ChangeNotifier {
  List<HairDressListViewModel> _favoritiesList = [];

  List<HairDressListViewModel> getList() {
    return _favoritiesList;
  }

  void add(HairDressListViewModel dressListViewModel) {
    _favoritiesList.add(dressListViewModel);
    notifyListeners();
  }

  // id ile silme eklenecek, kullanıcı favorilerinde çıkarttığında gelen veririnin id sine bakılarak silinecek.

}
