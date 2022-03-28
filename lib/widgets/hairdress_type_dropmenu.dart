import 'package:flutter/material.dart';
import 'package:hairdresser_mobile_app/constans/hairdress_types.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';
import 'package:hairdresser_mobile_app/providers/hairdress_types.dart';
import 'package:provider/provider.dart';

class HairDressTypeDropMenu extends StatelessWidget {
  var dropDownStateKey;
  HairDressTypeDropMenu({required this.dropDownStateKey ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingConst.hairDressTypePadding,
      child: Form(
        child: DropdownButtonFormField<String>(
          items: HairDressTypes.types,
          onChanged: (String? deger) {
            context.read<HairDressTypeProvider>().setSelectedItem = deger;
          },
          borderRadius: BorderRadius.circular(20),
          hint: Text("Kuaför Tipi Seçiniz"),
          value: context.watch<HairDressTypeProvider>().getSelectedItem,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
          validator: (value) {
            if (value!.isEmpty) {
              return "Lütfen Kuaför Tipini seçiniz";
            }
            return null;
          },
        ),
      ),
    );
  }
}
