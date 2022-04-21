import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/hairdress_profil_info.dart/hairdress_name..dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/hairdress_profil_info.dart/hairdress_phone.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/hairdress_profil_info.dart/open_and_close_hour.dart';

class HairDressProfilInfomation extends StatelessWidget {
  const HairDressProfilInfomation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
            HairDressName(),
            SizedBox(height: 3.h),
            HairDressPhone(),
            SizedBox(height: 3.h),
            OpenAndCloseHour(),
      ],
    );
  }
}