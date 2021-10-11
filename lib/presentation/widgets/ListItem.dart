import 'package:flutter/material.dart';
import 'package:pokedex_flutter/constants/defaultValue.dart';
import 'package:pokedex_flutter/models/common_model.dart';
import 'package:pokedex_flutter/utils/textFormatter.dart';

class ListItem extends StatelessWidget {
  final List<NamedAPIResource> pokemonList;
  final Function(String title, String url) navigator;
  final ScrollController scrollController;

  ListItem(this.pokemonList, this.navigator, this.scrollController);

  Widget _renderItem(BuildContext context, NamedAPIResource item) {
    String title = capitalFirstLetter(item.name);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          onPrimary: AppColor.textColor,
          primary: AppColor.white,
          padding: EdgeInsets.all(16)),
      onPressed: () {
        // TODO: Show modal here
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: AppFontSize.body,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        return _renderItem(context, pokemonList[index]);
      },
    );
  }
}
