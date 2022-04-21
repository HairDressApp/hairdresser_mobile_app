import 'package:flutter/material.dart';
import 'package:hairdresser_mobile_app/constans/margins.dart';

class OpenAndCloseHour extends StatelessWidget {
  const OpenAndCloseHour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String openHour = "9:30";
    String closeHour = "18:00";
    return Container(
      margin: MarginConst.hairDressInfoMargin,
      child: Text(
        "Açılış ve Kapanış Saat: $openHour - $closeHour",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
