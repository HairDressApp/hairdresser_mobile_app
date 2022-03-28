import 'package:flutter/material.dart';

class HairDressTypes {
  static List<DropdownMenuItem<String>> types = [
    DropdownMenuItem(child: Text("Kadın Kuaför"), value: "Kadın Kuaför"),
    DropdownMenuItem(child: Text("Berber"), value: "Berber"),
    DropdownMenuItem(child: Text("Güzellik Salonu"), value: "Güzellik Salonu"),
  ];
}
