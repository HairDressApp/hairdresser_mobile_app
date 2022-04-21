import 'package:flutter/material.dart';
import 'package:hairdresser_mobile_app/constans/images.dart';

class GalleryIcons extends StatelessWidget {
  const GalleryIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageConstance.galleryIcons,
      height: 25,
      width: 25,
      fit: BoxFit.cover,
    );
  }
}