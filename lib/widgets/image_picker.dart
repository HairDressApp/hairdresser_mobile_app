import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/images.dart';
import 'package:hairdresser_mobile_app/constans/margins.dart';
import 'package:hairdresser_mobile_app/providers/image.pick.dart';
import 'package:hairdresser_mobile_app/widgets/image_dialog.dart';
import 'package:hairdresser_mobile_app/widgets/show_bottom_sheet.dart';
import 'package:provider/provider.dart';

class HairDressImageProfile extends StatefulWidget {
  const HairDressImageProfile({Key? key}) : super(key: key);

  @override
  State<HairDressImageProfile> createState() => _HairDressImageProfileState();
}

class _HairDressImageProfileState extends State<HairDressImageProfile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: MarginConst.marginLeft8,
          child: GestureDetector(
            onTap: () async {
              try {
                await showDialog(
                    context: context, builder: (context) => ImageDialog());
              } catch (e) {
                print(e);
              }
            },
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.transparent,
              backgroundImage: context
                          .watch<ImagePickProvider>()
                          .getSelectImage !=
                      null
                  ? FileImage(
                      File(context.watch<ImagePickProvider>().getSelectImage))
                  : null,
              child: context.watch<ImagePickProvider>().getSelectImage != null
                  ? null
                  : Image.asset(ImageConstance.profileHairdressDefault),
            ),
          ),
        ),
        Positioned(
            right: 10,
            bottom: 0,
            child: IconButton(
              onPressed: () {
                ShowBottomSheet.getShowBottomSheet(context);  // Kamera veya galeridan resim almak için açılan bottom dialog
              },
              icon: Icon(
                Icons.add_a_photo,
                color: Color.fromARGB(255, 30, 9, 9),
              ),
              iconSize: 36,
            ))
      ],
    );
  }
}
