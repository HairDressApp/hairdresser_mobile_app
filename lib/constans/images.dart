import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class ImageConstance {
  static String profileHairdressDefault = "assets/images/kuafor_profil.png";

  static Future<File> getImageFileFromAssets(String path) async {
    // For file did convert this image.
    final byteData = await rootBundle.load('assets/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  // *********************** ICONS *******************************

  static String salonIcons = "assets/icons/salon.png";
  static String galleryIcons = "assets/icons/image-gallery.png";
  static String chatIcons = "assets/icons/chat.png";
  static String locationIcons = "assets/icons/location.png";

  // ***************************************************************

  static String logoImage = "assets/images/kuaf@4x.png";
}
