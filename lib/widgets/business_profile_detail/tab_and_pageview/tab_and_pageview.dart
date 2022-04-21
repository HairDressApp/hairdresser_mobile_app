import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/constans/images.dart';
import 'package:hairdresser_mobile_app/providers/business_image_pick.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/tab_and_pageview/chat_icon.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/tab_and_pageview/chat_pageview.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/tab_and_pageview/gallery_icon.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/tab_and_pageview/gallery_pageview.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/tab_and_pageview/hair_features_pageview.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/tab_and_pageview/location_icon.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/tab_and_pageview/location_pageview.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/tab_and_pageview/salon_icon.dart';
import 'package:provider/provider.dart';

class TabAndPageView extends StatefulWidget {
  const TabAndPageView({Key? key}) : super(key: key);

  @override
  State<TabAndPageView> createState() => _TabAndPageViewState();
}

class _TabAndPageViewState extends State<TabAndPageView>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: TabBar(
                  indicatorColor: ColorConstans.background,
                  onTap: (deger) {},
                  tabs: const [
                    Tab(
                      child: GalleryIcons(),
                    ),
                    Tab(child: SalonIcons()),
                    Tab(
                      child: ChatIcons(),
                    ),
                    Tab(
                      child: LocationIcons(),
                    ),
                  ]),
            ),
          
          //  new SliverFillRemaining()
         Container(
                  height: MediaQuery.of(context).size.height,
                child: TabBarView(children: [
                  GalleryPageview(),
                  HairFeaturesPageview(),
                  ChatPageView(),
                  LocationPageview(),
                ]),
              ),
           
            
          ],
        ),
      ),
    );
  }
}
