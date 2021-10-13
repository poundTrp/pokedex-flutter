import 'package:flutter/material.dart';
import 'package:pokedex_flutter/constants/defaultValue.dart';
import 'package:pokedex_flutter/presentation/widgets/custom_modal.dart';
import 'package:pokedex_flutter/utils/textFormatter.dart';

class PokemonDetail extends StatelessWidget {
  final String title;
  final int weight;
  final int height;
  final String? frontSprite;
  final String? backSprite;

  PokemonDetail({
    required this.title,
    required this.weight,
    required this.height,
    required this.frontSprite,
    required this.backSprite,
  });

  Widget _customBar(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.25,
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

  Widget _renderPicture() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            frontSprite ?? '',
            scale: 0.6,
          ),
          Image.network(
            backSprite ?? '',
            scale: 0.6,
          ),
        ],
      ),
    );
  }

  Widget _renderHeightAndWeight() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Weight: ',
          style: TextStyle(
            color: AppColor.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '$weight',
          style: TextStyle(
            color: AppColor.textColor,
          ),
        ),
        SizedBox(
          width: 32,
        ),
        Text(
          'Height: ',
          style: TextStyle(
            color: AppColor.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '$height',
          style: TextStyle(
            color: AppColor.textColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomModal(
      widget: Column(
        children: [
          Column(
            children: [
              _customBar(context),
              Text(
                capitalFirstLetter(title),
                style: TextStyle(
                  fontSize: AppFontSize.title,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _renderPicture(),
              _renderHeightAndWeight(),
            ],
          ),
        ],
      ),
    );
  }
}
