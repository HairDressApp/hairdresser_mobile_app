import 'package:flutter/cupertino.dart';

class ImagePickProvider extends ChangeNotifier {
  String? selectImage;
 
  get getSelectImage => this.selectImage;

  set setSelectImage(String? selectImage) {
    this.selectImage = selectImage;
    notifyListeners();
  }
}
