import 'package:flutter/material.dart';
import 'package:hairdresser_mobile_app/providers/favorite_icon.dart';
import 'package:provider/provider.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({Key? key}) : super(key: key);

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  late FavoriteIconProvider _favoriteProvider;
  @override
  Widget build(BuildContext context) {
    _favoriteProvider = Provider.of<FavoriteIconProvider>(context);
    return IconButton(
        onPressed: () {
          _favoriteProvider.isFavoriteClick();
        },
        icon: _favoriteProvider.isFavorite
            ? Icon(
                Icons.favorite,
                color: Colors.black,
                size: 32,
              )
            : Icon(
                Icons.favorite_outline,
                size: 32,
              ));
  }
}
