import 'package:flutter/material.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/appBar/showbottom_get_image.dart';
import 'package:hairdresser_mobile_app/widgets/show_bottom_sheet.dart';

class ImagePick extends StatelessWidget {
  const ImagePick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          ShowBottomGetImage.getShowBottomSheet(context);
        },
        icon: Icon(
          Icons.add_a_photo,
          color: Colors.black,
          size: 32,
        ));
  }
}
