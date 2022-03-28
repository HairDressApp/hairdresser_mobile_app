import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';
import 'package:hairdresser_mobile_app/providers/textediting_controller.dart';
import 'package:provider/provider.dart';

class HairDressOpenCloseTime extends StatefulWidget {
  var formState;
  HairDressOpenCloseTime({required this.formState, Key? key}) : super(key: key);

  @override
  State<HairDressOpenCloseTime> createState() => _HairDressOpenCloseTimeState();
}

class _HairDressOpenCloseTimeState extends State<HairDressOpenCloseTime> {
  late HairDressOpenAndCloseTimeProider _timeProvider;

  @override
  Widget build(BuildContext context) {
    _timeProvider =
        Provider.of<HairDressOpenAndCloseTimeProider>(context, listen: false);
    return Padding(
      padding: PaddingConst.businessPadding,
      child: Form(
          key: widget.formState,
          child: Column(
            children: [
              Row(
                children: [
                  openText(),
                  openTimeTextForm(context),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  closeText(),
                  closeTimeTextForm(),
                ],
              )
            ],
          )),
    );
  }

  Expanded openTimeTextForm(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 55, right: 10),
        child: TextFormField(
          keyboardType: TextInputType.datetime,
          onSaved: (deger) {
            _timeProvider.openText(deger!);
          },
          controller: context
              .watch<HairDressOpenAndCloseTimeProider>()
              .openTextController,
          // initialValue: _openTextController.text,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              fillColor: Colors.white,
              filled: true,
              hintText: context
                          .watch<HairDressOpenAndCloseTimeProider>()
                          .getOpenController() ==
                      null
                  ? null
                  : "Saat Seçiniz",
              suffixIcon: _showOpenTime(context)),
          validator: (value) {
            if (value!.isEmpty) {
              return "Açılış saati giriniz";
            }
            return null;
          },
        ),
      ),
    );
  }

  Text openText() {
    return Text(
      " Açılış: ",
      style: TextStyle(fontSize: 25, color: Colors.white),
    );
  }

  _showOpenTime(BuildContext context) {
    return IconButton(
        onPressed: () async {
          final TimeOfDay? result = await showTimePicker(
            confirmText: "Tamam",
            cancelText: "İptal",
            context: context,
            initialTime: TimeOfDay.now(),
            builder: (context, child) {
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    alwaysUse24HourFormat: true,
                  ),
                  child: child!);
            },
          );

          if (result != null) {
            context
                .read<HairDressOpenAndCloseTimeProider>()
                .openText(result.format(context));
          }
        },
        icon: Icon(Icons.timer));
  }

  closeText() {
    return Text(
      " Kapanış",
      style: TextStyle(fontSize: 25, color: Colors.white),
    );
  }

  closeTimeTextForm() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: 40, right: 10),
        child: TextFormField(
          keyboardType: TextInputType.datetime,
          onSaved: (deger) {
            _timeProvider.closeText(deger!);
          },
          controller: context
              .watch<HairDressOpenAndCloseTimeProider>()
              .closeTextController,
          // initialValue: _openTextController.text,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              fillColor: Colors.white,
              filled: true,
              hintText: context
                          .watch<HairDressOpenAndCloseTimeProider>()
                          .getCloseController() ==
                      null
                  ? null
                  : "Saat Seçiniz",
              suffixIcon: _showCloseTime(context)),
          validator: (value) {
            if (value!.isEmpty) {
              return "Kapanış saatini giriniz";
            }
            return null;
          },
        ),
      ),
    );
  }

  _showCloseTime(BuildContext context) {
    return IconButton(
        onPressed: () async {
          final TimeOfDay? result = await showTimePicker(
            confirmText: "Tamam",
            cancelText: "İptal",
            context: context,
            initialTime: TimeOfDay.now(),
            builder: (context, child) {
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    alwaysUse24HourFormat: true,
                  ),
                  child: child!);
            },
          );

          if (result != null) {
            context
                .read<HairDressOpenAndCloseTimeProider>()
                .closeText(result.format(context));
          }
        },
        icon: Icon(Icons.timer));
  }
}
