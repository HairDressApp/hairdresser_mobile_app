import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/providers/business_image_pick.dart';
import 'package:hairdresser_mobile_app/widgets/business_profile_detail/tab_and_pageview/my_images_appbar.dart';
import 'package:hairdresser_mobile_app/widgets/register_appbar.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class FullScreenImageList extends StatefulWidget {
  const FullScreenImageList({Key? key}) : super(key: key);

  @override
  State<FullScreenImageList> createState() => _FullScreenImageListState();
}

class _FullScreenImageListState extends State<FullScreenImageList> {
  late BusinessImagePickProvider _pickProvider;
  @override
  Widget build(BuildContext context) {
    _pickProvider = Provider.of<BusinessImagePickProvider>(context);
    return Scaffold(
      backgroundColor: ColorConstans.feedBackground,
      appBar: PreferredSize(
          child: MyImagesAppBar(title: "Resimlerim"),
          preferredSize: Size(double.infinity, 50)),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  padding: EdgeInsets.only(bottom: 150.h),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 2),
                  itemCount: _pickProvider.getImageList().length,
                  itemBuilder: (context, index) {
                    File image = File(_pickProvider.getImageList()[index]);
                    return Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    debugPrint(index.toString());
                                  },
                                  icon: Icon(Icons.more_vert))
                            ],
                          ),
                          Expanded(
                            child: Container(
                              decoration:
                                  BoxDecoration(border: Border.all(width: 1)),
                              width: MediaQuery.of(context).size.width,
                              child: Image.file(
                                image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
