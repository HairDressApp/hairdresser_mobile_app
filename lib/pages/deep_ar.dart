
/*

import 'package:rwa_deep_ar/rwa_deep_ar.dart';
import 'package:flutter/material.dart';

class DeepAr extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<DeepAr> {
  late CameraDeepArController cameraDeepArController;
  int currentPage = 0;
  final vp = PageController(viewportFraction: .24);
  Effects currentEffect = Effects.none;
  Filters currentFilter = Filters.none;
  Masks currentMask = Masks.none;
  bool isRecording = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CameraDeepAr(
              onCameraReady: (isReady) {
                print("Camera status $isReady");
              },
              onImageCaptured: (path) {
                print("Image Taken $path");
              },
              onVideoRecorded: (path) {
                print("Video Recorded @ $path");
              },
              //Enter the App key generate from Deep AR
              androidLicenceKey:
                  "ceffe521128256bc45fa3d292647d8f56963b3914662b6873e5713af8335432b6aad43be3af99fb2",
              iosLicenceKey:
                  "8ad701adce8f35beff600bf4c08efe58aa8c36dd024a520be25a70ad39af75f68c646513f9161afe",
              cameraDeepArCallback: (c) async {
                cameraDeepArController = c;
                setState(() {});
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
              //height: 250,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(Masks.values.length, (p) {
                        bool active = currentPage == p;
                        return GestureDetector(
                          onTap: () {
                            currentPage = p;
                            cameraDeepArController.changeMask(p);
                            setState(() {});
                          },
                          child: Container(
                              margin: EdgeInsets.all(5),
                              width: active ? 40 : 30,
                              height: active ? 50 : 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: active ? Colors.green : Colors.white,
                                  shape: BoxShape.circle),
                              child: Text(
                                "$p",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: active ? 16 : 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800),
                              )),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

*/