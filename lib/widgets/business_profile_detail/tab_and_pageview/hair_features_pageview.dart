import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HairFeaturesPageview extends StatefulWidget {
  HairFeaturesPageview({Key? key}) : super(key: key);

  @override
  State<HairFeaturesPageview> createState() => _HairFeaturesPageviewState();
}

class _HairFeaturesPageviewState extends State<HairFeaturesPageview> {
  List<String> hairFeatures = ["Saç Boyama", "Kaynak",
  
    "Maşa",
  "Çıt çıt maşa",
  "Keratin bakım",
  "Saç bakım",
  "Saç Botox",
  "Saç örgü",
  "Manikür",
  "Pedikür",
  "Törpü oje",
  "Komple ağda",
  "Kaş",
  
  
  ];

  @override
  Widget build(BuildContext context) {   // Kuaförde yapıalcak olan işlemleri profilde göstermesi
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: 10.h),
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: hairFeatures.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 2, mainAxisSpacing: 8),
          itemBuilder: (context, index) {
            return Container(
              width: 100.w,
              height: 70.h,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  title: Center(
                    child: Wrap(
                      alignment: WrapAlignment.end,
                        children: [Text(hairFeatures[index],softWrap: true,)]),
                  ),
                ),
                elevation: 6,
              ),
            );
          }));
  }
}
