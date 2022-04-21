import 'package:flutter/cupertino.dart';

class BusinessImagePickProvider extends ChangeNotifier {
  String? _selectImage;

  get selectImage => this._selectImage;

  set selectImage(value) {
    this._selectImage = value;
    notifyListeners();
  }

  List<String> _imagesList = [];

  List<String> getImageList() {
    return _imagesList;
  }

  void imageAdd(a) {
  
    _imagesList.add(a.toString());
    notifyListeners();
    
  }

  void imageRemove(int index) {
    _imagesList.removeAt(index);
    notifyListeners();
  }
}
