
 import 'package:flutter/material.dart';

var listDropItem = List.generate(
        hairDressTransactions.length,
        (index) => DropdownMenuItem(
              child: Text(hairDressTransactions[index]),
              value: hairDressTransactions[index],
            ));





List<String> hairDressTransactions = [
  "Şekillendirme",
  "Fön",
  "Çıt çıt fön",
  "Star kırık fön",
  "Model saç kesim",
  "Çocuk kesim",
  "Kesim",
  "Dip Boya",
  "İnoa boya",
  "Ombre balyaj kısa saç",
  "Bölgesel balyaj",
  "Röfle kısa saç",
  "Silme İşlemi kısa saç",
  "Dip açma",
  "Topuz",
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
  "Bıyık",
  "Porselen makyaj",
  "Kirpik (adet)",
  "Kirpik(adet-haftalık)",
  "Kalıcı oje",
  "Gelin sepeti (saç,makyaj,dekolte,kirpik,manikür,pedikür,kaş,bıyık,prova)",
  "Kına – nişan (saç,makyaj,kirpik)"
];
