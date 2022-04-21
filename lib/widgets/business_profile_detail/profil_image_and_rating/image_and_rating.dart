import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/profil_image_and_rating/hairdress_profil_image.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/profil_image_and_rating/rating.dart';
import 'package:hairdresser_mobile_app/widgets/image_picker.dart';

class ImageProfileAndRating extends StatefulWidget {
  const ImageProfileAndRating({Key? key}) : super(key: key);

  @override
  State<ImageProfileAndRating> createState() => _ImageProfileAndRatingState();
}

class _ImageProfileAndRatingState extends State<ImageProfileAndRating> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 1.w,),
        BusinessProfilImage(),
        Rating()
      ],
    );
  }
}