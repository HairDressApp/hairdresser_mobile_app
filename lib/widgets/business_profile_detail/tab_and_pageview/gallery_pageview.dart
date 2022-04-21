import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/providers/business_image_pick.dart';
import 'package:hairdresser_mobile_app/routes/routes.dart';
import 'package:provider/provider.dart';

class GalleryPageview extends StatefulWidget {
  const GalleryPageview({Key? key}) : super(key: key);

  @override
  State<GalleryPageview> createState() => _GalleryPageviewState();
}

class _GalleryPageviewState extends State<GalleryPageview> {
  late BusinessImagePickProvider _imageProvider;

  @override
  Widget build(BuildContext context) {
    _imageProvider = Provider.of<BusinessImagePickProvider>(context);

    debugPrint("Resim: " + _imageProvider.selectImage.toString());
    return _imageProvider.getImageList().length <= 0
        ? Container(
            child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Icon(
                Icons.add_a_photo_outlined,
                size: 92,
                color: Color.fromARGB(255, 156, 155, 155),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "İlk fotografını paylaş",
                style: TextStyle(fontSize: 18),
              )
            ],
          ))
        : Container(
            padding: EdgeInsets.only(bottom: 10.h),
            
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 2),
                itemCount: _imageProvider.getImageList().length,
                itemBuilder: (context, index) {
                  File image = File(_imageProvider.getImageList()[index]);
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(fullScreenImage);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Image.file(image, fit: BoxFit.fill),
                    ),
                  );
                }),
          );
  }
}
