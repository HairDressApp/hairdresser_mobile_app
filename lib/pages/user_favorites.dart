import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/widgets/feed_appbar.dart';
import 'package:hairdresser_mobile_app/widgets/under_appbar_divider.dart';
import 'package:hairdresser_mobile_app/widgets/user_favorities_list.dart';

class UserFavorities extends StatefulWidget {
  const UserFavorities({Key? key}) : super(key: key);

  @override
  State<UserFavorities> createState() => _UserFavoritiesState();
}

class _UserFavoritiesState extends State<UserFavorities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstans.feedBackground,
      appBar: PreferredSize(
          child: FeedAppBar(title: "Favorilerim"),
          preferredSize: Size(double.infinity, 50)),
      body: Column(
        children: [
          UnderAppbarDivider(),
          SizedBox(height:30.h ,),
          Expanded(child: UserFavoriList()),
        ],
      ),
    );
  }


  



}
