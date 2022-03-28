import 'package:flutter/material.dart';
import 'package:hairdresser_mobile_app/constans/colors.dart';
import 'package:hairdresser_mobile_app/providers/search_select_sehir.dart';
import 'package:provider/provider.dart';

extension StringExts on String {
  String toLowerCaseTr() {
    return replaceAll("I", "ı")
        .replaceAll("İ", "i")
        .replaceAll("Ç", "ç")
        .replaceAll("Ş", "ş")
        .toLowerCase();
  }
}

class SearchSelect extends StatefulWidget {
  final List<String> items;
  final String selectedItem;
  final void Function(String) onSelection;

  const SearchSelect({
    Key? key,
    required this.items,
    this.selectedItem = "",
    required this.onSelection,
  }) : super(key: key);

  @override
  _SearchSelectPageState createState() => _SearchSelectPageState();
}

//Tıklanınca gidilen sayfa
class _SearchSelectPageState extends State<SearchSelect> {
  ///String filtrelenen_kelime = "";
  // late String _seciliolan;
  late SearchSelectSehirProvider _sehirProvider;
  @override
  void initState() {
    /* _seciliolan = widget.selectedItem;
    //_seciliolan boş değilse yukarıdan gelen liste sırala yani seçili olanı en üstte göstermek için
    if (_seciliolan.isNotEmpty) {
      widget.items.sort((a, b) => _seciliolan == a
          ? -1
          : a.compareTo(b)); //seçili olan üstte diğerleri alfabatik sıraladık
    }
*/

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _sehirProvider = Provider.of<SearchSelectSehirProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: ColorConstans.feedBackground,
        title: TextField(
          decoration: const InputDecoration(
            hintText: "İl Arayınız..",
            hintStyle: TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
          cursorColor: Colors.purple,
          onChanged: (v) {
            _sehirProvider.filtrelenenkelime = v;
          },
        ),
      ),
      body: ListView(
        children: [
          //filtreleme yaparken herhangi bir harf yazınca listeyi küçük harfe çevirdik
          for (final item in widget.items.where((element) => element
              .toLowerCaseTr()
              .contains(
                  _sehirProvider.filtrelenenkelime.toString().toLowerCaseTr())))
            Card(
              color: ColorConstans.feedBackground, //arka plan rengi veriyoruz
              child: ListTile(
                onTap: () {
                  widget.onSelection(item);
                  _sehirProvider.setSeciliOlan = item;
                },
                title: Builder(
                  builder: (context) {
                    final items = item.toLowerCaseTr().split(_sehirProvider
                        .filtrelenenkelime
                        .toString()
                        .toLowerCaseTr());

                    return Text.rich(
                      TextSpan(
                        children: [
                          for (final itemPart in items)
                            TextSpan(
                              children: [
                                TextSpan(text: itemPart),
                                if (itemPart != items.last)
                                  TextSpan(
                                    text: _sehirProvider.filtrelenenkelime,
                                    style: TextStyle(
                                      background: Paint()
                                        ..color = Colors.purple.shade300,
                                    ),
                                  ),
                              ],
                            ),
                        ],
                      ),
                    );
                  },
                ),
                trailing: Icon(
                  //ikon tanımladık seçili olunca yeşil rengi verdik
                  Icons.where_to_vote,
                  color: _sehirProvider.getSeciliOlan == item
                      ? Colors.green.shade900
                      : Colors.grey.withOpacity(0.2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
