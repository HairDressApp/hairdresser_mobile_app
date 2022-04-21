import 'package:flutter/material.dart';

class LocationPageview extends StatelessWidget {
  const LocationPageview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Center(
        child: Text("Konumu gelecek"),
      ),
    );
  }
}
