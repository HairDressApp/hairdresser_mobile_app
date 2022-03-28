import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/color_convert/hexcolor.dart';
import 'package:hairdresser_mobile_app/constans/hairdress_transactions.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';
import 'package:hairdresser_mobile_app/model/hairdress_transaction.dart';
import 'package:hairdresser_mobile_app/providers/hairdress_transaction.dart';
import 'package:hairdresser_mobile_app/providers/hairdress_transaction_list.dart';
import 'package:hairdresser_mobile_app/widgets/hairdress_transaction_list_container.dart';
import 'package:provider/provider.dart';

class HairDressTransactionDrop extends StatefulWidget {
  const HairDressTransactionDrop({Key? key}) : super(key: key);

  @override
  State<HairDressTransactionDrop> createState() =>
      _HairDressTransactionDropState();
}

class _HairDressTransactionDropState extends State<HairDressTransactionDrop> {
  var _priceState = GlobalKey<FormState>();

  late HairDressTransactionProvider
      _transactionProvider; // Bu provider işlem  ismi ve fiyatı alan

  late HairDressTransactionListProvider
      _transactionListProvider; // Bu da ekle butonuna basıldığında bunlar ılisteye atmak için kullanılan provider

  @override
  Widget build(BuildContext context) {
    _transactionListProvider =
        Provider.of<HairDressTransactionListProvider>(context, listen: false);
    _transactionProvider =
        Provider.of<HairDressTransactionProvider>(context, listen: false);
    return Padding(
      padding: PaddingConst.hairDressTransactionDropPadding,
      child: Form(
        key: _priceState,
        child: Column(
          children: [
            transactionDropDownMenu(context),
            SizedBox(
              height: 5.h,
            ),
            priceTransaction(),
            SizedBox(
              height: 15.h,
            ),
            addButton(),
            SizedBox(
              height: 15.h,
            ),
            KuaforList(onDismissed: (index) {
              _transactionListProvider.remove(index);
            })
          ],
        ),
      ),
    );
  }

  TextFormField priceTransaction() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (deger) {
        context.read<HairDressTransactionProvider>().price = deger;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: "Fiyat giriniz",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Lütfen fiyat giriniz";
        }
        return null;
      },
    );
  }

  DropdownButtonFormField<String> transactionDropDownMenu(
      BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      items: listDropItem,
      onChanged: (String? deger) {
        context.read<HairDressTransactionProvider>().selectedItem = deger!;
      },
      borderRadius: BorderRadius.circular(20),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          fillColor: Colors.white,
          filled: true),
      value: context.watch<HairDressTransactionProvider>().getSelectedItem,
      hint: Text("İşlem Seçiniz"),
    );
  }

  addButton() {
    return Container(
      width: 140.w,
      height: 50.h,
      child: ElevatedButton(
        onPressed: () {
          if (_priceState.currentState!.validate()) {
            _priceState.currentState!.save();
            HairDressTransactionModel transactionModel =
                HairDressTransactionModel();

            transactionModel.transactionName =
                _transactionProvider.getSelectedItem;

            transactionModel.price = _transactionProvider.getPrice;

            _transactionListProvider.add(transactionModel);
          }
        },
        child: Text("Ekle"),
        style: ElevatedButton.styleFrom(
            primary: HexColor("#2ECC71"),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            alignment: Alignment.center),
      ),
    );
  }
}
