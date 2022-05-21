import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

class ToastShow {
  static void showToast(BuildContext context, String msg,
      {int? duration, int? gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }
}
