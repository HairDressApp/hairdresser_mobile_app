import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/color_convert/hexcolor.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/routes/routes.dart';
import 'package:hairdresser_mobile_app/widgets/business_address_text_form.dart';
import 'package:hairdresser_mobile_app/widgets/hairdress_open_close_time.dart';
import 'package:hairdresser_mobile_app/widgets/hairdress_type_dropmenu.dart';
import 'package:hairdresser_mobile_app/widgets/image_picker.dart';
import 'package:hairdresser_mobile_app/widgets/register_appbar.dart';
import 'package:hairdresser_mobile_app/widgets/transaction_drop_down.dart';

class BusinessAnotherSignUp extends StatefulWidget {
  const BusinessAnotherSignUp({Key? key}) : super(key: key);

  @override
  State<BusinessAnotherSignUp> createState() => _BusinessAnotherSignUpState();
}

class _BusinessAnotherSignUpState extends State<BusinessAnotherSignUp> {
  var _formState = GlobalKey<FormState>();
  var _timeFormState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstans.background,
      appBar: PreferredSize(
          child: RegisterAppBar(title: "Kuaför İşletme Oluşturma"),
          preferredSize: const Size(double.infinity, 50)),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            HairDressImageProfile(), // Kuaför profil resmi eklemesi için
            SizedBox(
              height: 10.h,
            ),
            HairDressTypeDropMenu(
                dropDownStateKey:
                    _formState), // Kuaför Tipini seçiyor, Berber, Kadın kuaför veya güzellik salonu gibi..
            BusinessRegisterTextForm(
                formState: _formState), // Adres kısmını felan alıcaz
            HairDressOpenCloseTime(
                formState:
                    _timeFormState), // Kuaförün açlış ve kapanış saaatleri
            HairDressTransactionDrop(), // Kuaförde yapılacak işlemleri seçiyor
            SizedBox(
              height: 15.h,
            ),
            _signUpButton(),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }

  _signUpButton() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 140.w,
        height: 50.h,
        child: ElevatedButton(
          onPressed: () {
            if (_formState.currentState!.validate() &&
                _timeFormState.currentState!.validate()) {
              _formState.currentState!.save();
              _timeFormState.currentState!.save();
            }
          },
          child: Text("Kaydol"),
          style: ElevatedButton.styleFrom(
              primary: HexColor("#2ECC71"),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              alignment: Alignment.center),
        ),
      ),
    );
  }
}
