import 'package:flutter/material.dart';
import 'package:pokedex_flutter/constants/defaultValue.dart';
import 'package:pokedex_flutter/models/common_model.dart';
import 'package:pokedex_flutter/utils/textFormatter.dart';

class ListItem extends StatelessWidget {
  final List<NamedAPIResource> pokemonList;
  final ScrollController scrollController;

  ListItem(this.pokemonList, this.scrollController);

  Widget _customBar(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.15,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        child: Container(
          height: 4.0,
          decoration: BoxDecoration(
            color: AppColor.customBarColor,
            borderRadius: const BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }

  Widget _renderItem(BuildContext context, NamedAPIResource item) {
    String title = capitalFirstLetter(item.name);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          onPrimary: AppColor.textColor,
          primary: AppColor.white,
          padding: EdgeInsets.all(16)),
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                color: Colors.transparent,
                child: Container(
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: new Radius.circular(20.0),
                      topRight: new Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      _customBar(context),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: AppFontSize.title,
                        ),
                      ),
                      Text('This is ${item.url}'),
                      Row(
                        children: [
                          Text('Weight: 10'),
                          Text('Height: 10'),
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
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
