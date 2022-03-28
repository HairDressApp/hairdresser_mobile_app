import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/hairdress_types.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';
import 'package:hairdresser_mobile_app/providers/business_address_text_form.dart';
import 'package:hairdresser_mobile_app/providers/hairdress_types.dart';
import 'package:provider/provider.dart';

class BusinessRegisterTextForm extends StatefulWidget {
  var formState;

  BusinessRegisterTextForm({required this.formState, Key? key})
      : super(key: key);

  @override
  State<BusinessRegisterTextForm> createState() =>
      _BusinessRegisterTextFormState();
}

class _BusinessRegisterTextFormState extends State<BusinessRegisterTextForm> {
  late BusinessAddressTextFormProvider _textFormProvider;
  @override
  Widget build(BuildContext context) {
    _textFormProvider =
        Provider.of<BusinessAddressTextFormProvider>(context, listen: false);
    return Padding(
      padding: PaddingConst.businessPadding,
      child: Form(
          key: widget.formState,
          child: Column(
            children: [
              textFormHairDressIl(),
              SizedBox(
                height: 5.h,
              ),
              textFormHairDressIlce(),
              SizedBox(
                height: 5.h,
              ),
              textFormHairDressMahalle(),
              SizedBox(
                height: 5.h,
              ),
              textFormHairDressAddress()
            ],
          )),
    );
  }

  TextFormField textFormHairDressAddress() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      onSaved: (deger) {
        _textFormProvider.setAdres = deger;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          fillColor: Colors.white,
          filled: true,
          hintText: "Adresinizi giriniz"),
      validator: (value) {
        if (value!.isEmpty) {
          return "Lütfen tam adresinizi giriniz";
        }
        return null;
      },
    );
  }

  TextFormField textFormHairDressMahalle() {
    return TextFormField(
      onSaved: (deger) {
        _textFormProvider.setMahalle = deger;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        fillColor: Colors.white,
        filled: true,
        hintText: "Mahalle giriniz",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Mahalle giriniz";
        }
      },
    );
  }

  TextFormField textFormHairDressIlce() {
    return TextFormField(
      onSaved: (deger) {
        _textFormProvider.setIlce = deger;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: "İlçe giriniz",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Lütfen İlçe giriniz";
        }
        return null;
      },
    );
  }

  textFormHairDressIl() {
    return TextFormField(
      onSaved: (deger) {
        _textFormProvider.setIl = deger;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        filled: true,
        fillColor: Colors.white,
        hintText: "İl giriniz",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Lütfen Il giriniz";
        }
        return null;
      },
    );
  }
}
