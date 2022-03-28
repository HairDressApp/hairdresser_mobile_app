import 'package:flutter/cupertino.dart';

class BusinessAddressTextFormProvider extends ChangeNotifier{
  // Kuaförün adres bilgilerini alğımız yer olacak.
  String? il;
  String? ilce;
  String? mahalle;
  String? adres;

   get getIl => this.il;

 set setIl(String? il) {
    this.il = il;
 } 

  get getIlce => this.ilce;

 set setIlce( ilce) {
   this.ilce = ilce;
 } 

  get getMahalle => this.mahalle;

 set setMahalle( mahalle){
   this.mahalle = mahalle;
 } 

  get getAdres => this.adres;

 set setAdres( adres) {
   this.adres = adres;
 } 
}
