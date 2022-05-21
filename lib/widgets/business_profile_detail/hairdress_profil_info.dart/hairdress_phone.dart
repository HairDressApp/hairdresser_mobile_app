import 'package:flutter/material.dart';
import 'package:hairdresser_mobile_app/constans/margins.dart';

class HairDressPhone extends StatelessWidget {
  const HairDressPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: MarginConst.hairDressInfoMargin,
      child: Text(
        "+905467415896",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
