import 'package:flutter/material.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/routes/routes.dart';

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).popAndPushNamed(hairdressSelectType);
      },
      backgroundColor: ColorConstans.background,
      child: Icon(Icons.home),
    );
  }
}
