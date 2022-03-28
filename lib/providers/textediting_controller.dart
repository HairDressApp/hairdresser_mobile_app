import 'package:flutter/cupertino.dart';

class HairDressOpenAndCloseTimeProider extends ChangeNotifier {
  TextEditingController? _openTextController = TextEditingController();
  TextEditingController? _closeTextController = TextEditingController();
  get openTextController => this._openTextController;

  get closeTextController => this._closeTextController;

  void openText(String time) {
    _openTextController!.text = time;
    notifyListeners();
  }

  void closeText(String time) {
    _closeTextController!.text = time;
    notifyListeners();
  }

  String getOpenController() {
    return _openTextController!.text;
  }

  String getCloseController() {
    return _closeTextController!.text;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _openTextController!.dispose();
    _closeTextController!.dispose();
  }
}
