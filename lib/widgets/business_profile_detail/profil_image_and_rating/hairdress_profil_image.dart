import 'package:flutter/material.dart';
import 'package:hairdresser_mobile_app/constans/images.dart';

class BusinessProfilImage extends StatelessWidget {
  const BusinessProfilImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 70,
      backgroundImage: null,
      backgroundColor: Colors.transparent,
      child: Image.asset(ImageConstance.profileHairdressDefault),
    );
  }
}
