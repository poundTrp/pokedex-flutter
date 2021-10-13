import 'package:flutter/material.dart';
import 'package:pokedex_flutter/constants/defaultValue.dart';

class CustomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}
