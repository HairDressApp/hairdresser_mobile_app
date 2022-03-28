import 'package:flutter/material.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/constans/padding.dart';
import 'package:hairdresser_mobile_app/constans/sehirler.dart';
import 'package:hairdresser_mobile_app/providers/search_select_sehir.dart';
import 'package:hairdresser_mobile_app/widgets/home.floatingaction_button.dart';
import 'package:hairdresser_mobile_app/widgets/search_select.dart';
import 'package:hairdresser_mobile_app/widgets/user_navigation_menu.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  late SearchSelectSehirProvider _sehirProvider;
  @override
  Widget build(BuildContext context) {
    _sehirProvider = Provider.of<SearchSelectSehirProvider>(context);

    return Scaffold(
      backgroundColor: ColorConstans.feedBackground,
      appBar: AppBar(
        backgroundColor: ColorConstans.feedAppbarColor,
        iconTheme: IconThemeData(color: ColorConstans.feedBackground),
        actions: [
          Padding(
            padding: PaddingConst.feedSearchIcon,
            child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) {
                      return SearchSelect(
                          items: tumSehirler,
                          selectedItem: _sehirProvider.selectSehir,
                          onSelection: (deger) {
                            _sehirProvider.selectSehir = deger;
                          });
                    },
                  ));
                },
                icon: Icon(
                  Icons.search,
                  size: 36,
                  color: Colors.black26,
                )),
          )
        ],
      ),
      drawer: UserNavigationManu(),
      body: Container(
        child: Center(
          child: Text(_sehirProvider.selectSehir.toString()),
        ),
      ),
      floatingActionButton: HomeFloatingActionButton(),
    );
  }
}
