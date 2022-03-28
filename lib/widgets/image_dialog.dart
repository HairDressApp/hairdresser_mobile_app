import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/images.dart';
import 'package:hairdresser_mobile_app/providers/image.pick.dart';
import 'package:provider/provider.dart';

class ImageDialog extends StatefulWidget {
  ImageDialog({Key? key}) : super(key: key);

  @override
  State<ImageDialog> createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  @override
  Widget build(BuildContext context) {
    File file = _fileToImage();
    return Dialog(
      // Kuaför kayıt sayfasındaki profil resmi tıkladığında büyütmesine yarıyan widget
      child: Container(
        width: 200.w,
        height: 200.h,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: context.watch<ImagePickProvider>().getSelectImage != null
                    ? FileImage(
                        File(context.watch<ImagePickProvider>().getSelectImage))
                    : FileImage(file),
                fit: BoxFit.fill)),
      ),
    );
  }

  _fileToImage() async {
    File f = await ImageConstance.getImageFileFromAssets(
        ImageConstance.profileHairdressDefault);
    return f;
  }
}
