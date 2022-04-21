import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/appBar/custom_appbar.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/hairdress_profil_info.dart/profil_info.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/profil_image_and_rating/image_and_rating.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/tab_and_pageview/tab_and_pageview.dart';

class BusinessProfileDetail extends StatefulWidget {
  const BusinessProfileDetail({Key? key}) : super(key: key);

  @override
  State<BusinessProfileDetail> createState() => _BusinessProfileDetailState();
}

class _BusinessProfileDetailState extends State<BusinessProfileDetail> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstans.feedBackground,
      appBar: PreferredSize(
          child: CustomAppBar(), preferredSize: Size(double.infinity, 50)),
      body: Container(
        child: CustomScrollView(
          // Kuaför profilin detay sayfası
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(top: 15.h),
              sliver: SliverToBoxAdapter(
                child: ImageProfileAndRating(),
              ),
            ),
            SliverPadding(
                padding: EdgeInsets.only(top: 8.h),
                sliver: SliverToBoxAdapter(
                  child: HairDressProfilInfomation(),
                )),
            SliverPadding(
              padding: EdgeInsets.only(top: 20.h),
              sliver: SliverToBoxAdapter(
                child: TabAndPageView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
