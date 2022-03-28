import 'package:flutter/material.dart';
import 'package:hairdresser_mobile_app/providers/user_favorities.dart';
import 'package:provider/provider.dart';

class UserFavoriList extends StatefulWidget {
  const UserFavoriList({Key? key}) : super(key: key);

  @override
  State<UserFavoriList> createState() => _UserFavoriListState();
}

class _UserFavoriListState extends State<UserFavoriList> {
  late UserFavoritiesProvider _favoriProvider;

  @override
  Widget build(BuildContext context) {
    _favoriProvider = Provider.of<UserFavoritiesProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      child: _favoriProvider.getList().length > 0
          ? ListView.builder(
            itemCount: _favoriProvider.getList().length,
            itemBuilder: (context, index) {
              return Card(      
                child: ListTile(
                  leading: Text("Image Gelecek"),
                  title: Text("Kuaför Adı"),
                  subtitle: Text("Adresi olacak"),
                  trailing: Text("Konum mesafesi ve icon olacak"),
                ),
              );
            })
          : Center(
              child: Text("Favori Kuaförünü Ekle ve Göster"),
            ),
    );
  }
}
