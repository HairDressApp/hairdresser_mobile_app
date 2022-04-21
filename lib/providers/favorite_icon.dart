import 'package:flutter/cupertino.dart';

class FavoriteIconProvider extends ChangeNotifier {
  bool isFavorite = false;

  get getIsFavorite => this.isFavorite;

  void isFavoriteClick() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
