import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/text_style.dart';
import 'package:hairdresser_mobile_app/helper/hairdress_list_helper.dart';
import 'package:hairdresser_mobile_app/routes/routes.dart';

class HairDressList extends StatelessWidget {
  const HairDressList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: HairDressListHelper.anasayfaList.isNotEmpty
            ? ListView.builder(
                itemCount: HairDressListHelper.anasayfaList.length,
                itemBuilder: (context, index) {
                  var anasayfaList = HairDressListHelper.anasayfaList[
                      index]; // KuaförAnasayfaModal erişmek için listeden kullanıyoruz
                  return Card(
                    elevation: 4,
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed(businessProfileDetail);
                      },
                      contentPadding: EdgeInsets.all(10),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/1.jpg"),
                        radius: 50,
                      ), // Kuafor Profil Resmi olacak
                      title: Text(anasayfaList.kuaforName!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),), // Kuaför adı
                      subtitle:
                          Text(anasayfaList.kuaforAdress!), // Kuaför adressi
                      trailing: Column(
                        children: [
                          Text(anasayfaList.rotaHesap.toString()+" KM" ,style: TextStyle(fontSize: 22),),
                          Icon(Icons.add_road_rounded),
                        ],
                      ), // Mesafesi olacak
                    ),
                  );
                })
            : Container(
                margin: EdgeInsets.only(bottom: 0.3.sh),
                child: Center(
                  child: Text(
                    "Görüntülenecek Herhangi Kuaför Yok",
                    style: TextStyleCons.feedTextStyle,
                  ),
                ),
              ),
      ),
    );
  }
}