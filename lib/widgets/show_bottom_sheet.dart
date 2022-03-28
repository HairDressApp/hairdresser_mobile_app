import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/providers/image.pick.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ShowBottomSheet {
  static final _picker = ImagePicker();

  static late ImagePickProvider _imagePickProvider;

  static PersistentBottomSheetController<dynamic>? getShowBottomSheet(
      BuildContext context) {
    _imagePickProvider = Provider.of<ImagePickProvider>(context, listen: false);
    showBottomSheet(
        context: context,
        builder: (context) {
          return Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: 200.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  tabButtonPaint(), // Dialog açıldğında üst button çizimi
                  SizedBox(
                    height: 50.h,
                  ),
                  getToGallery(),
                  SizedBox(
                    height: 40.h,
                  ),
                  getToCamera()
                ],
              ),
            ),
          );
        });
  }

  static Widget getToCamera() {
    return InkWell(
      onTap: () {
        getFromCameraImage();
      },
      child: Row(
        children: [
          Icon(
            Icons.photo_camera,
            size: 32,
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            "Kameradan resim al",
            style: TextStyle(fontSize: 21),
          ),
        ],
      ),
    );
  }

  static Widget getToGallery() {
    return InkWell(
      onTap: () {
        getFromGalleryImage();
      },
      child: Row(
        children: [
          Icon(
            Icons.add_photo_alternate,
            size: 34,
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            "Galeriden resim al",
            style: TextStyle(fontSize: 21),
          )
        ],
      ),
    );
  }

  static Align tabButtonPaint() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 70.w,
        height: 10.h,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  static Future getFromGalleryImage() async {
    // Galeriye gidip galeriden resim alan metod
    debugPrint("getFromGaleri çalıştı");
    try {
      var pickedImage = await _picker.getImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        _imagePickProvider.setSelectImage = pickedImage.path;
        // _image = File(pickedImage.path);
        // widget.ImageSelect!(selectedImage);
      } else {
        debugPrint("Resim seçilmedi");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future getFromCameraImage() async {
    // Kameradan resim alan metod
    debugPrint("getFromGaleri çalıştı");
    try {
      var pickedImage = await _picker.getImage(source: ImageSource.camera);

      if (pickedImage != null) {
        _imagePickProvider.setSelectImage = pickedImage.path;
      } else {
        debugPrint("Resim seçilmedi");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
