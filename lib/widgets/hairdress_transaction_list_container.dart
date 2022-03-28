import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hairdresser_mobile_app/model/hairdress_transaction.dart';
import 'package:hairdresser_mobile_app/providers/hairdress_transaction_list.dart';
import 'package:provider/provider.dart';

class KuaforList extends StatefulWidget {
  Function onDismissed;
  KuaforList({required this.onDismissed, Key? key}) : super(key: key);

  @override
  State<KuaforList> createState() => _KuaforListState();
}

class _KuaforListState extends State<KuaforList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black)),
        height: 250.h,
        child: context
                .watch<HairDressTransactionListProvider>()
                .getTransaction()
                .isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: context
                    .watch<HairDressTransactionListProvider>()
                    .getTransaction()
                    .length,
                itemBuilder: (context, index) {
                  HairDressTransactionModel model = context
                      .watch<HairDressTransactionListProvider>()
                      .getTransaction()[index];
                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (a) {
                      widget.onDismissed(index);
                    },
                    child: Card(
                      child: ListTile(
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              model.price.toString(),
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Image.asset(
                              "assets/images/lira.png",
                              width: 20,
                              height: 20,
                            ),
                          ],
                        ),
                        title: Text(model.transactionName.toString()),
                        leading: CircleAvatar(
                          backgroundColor: Colors.purple.shade100,
                          child: Text((index + 1).toString()),
                        ),
                      ),
                    ),
                  );
                })
            : Center(
                child: Text(
                "Kuaför İşlemleri Ekleyin Listeye",
              )),
      ),
    );
  }
}
