import 'package:hairdresser_mobile_app/model/hairdress_list_modal.dart';

class HairDressListHelper{

 static List<HairDressListModal> anasayfaList = [HairDressListModal("Arzum Bayan Kuaför", "Yeni, 24. Sk. No:1, 15030 Burdur Merkez/Burdur", "1")];

  static add(HairDressListModal anasayfaModal) {
    anasayfaList.add(anasayfaModal);
  }

}