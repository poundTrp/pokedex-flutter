import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex_flutter/constants/defaultValue.dart';

class Loader extends StatelessWidget {
  final String loadingMessage;

  Loader({required this.loadingMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            loadingMessage,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: AppFontSize.title),
          ),
          SizedBox(
            height: 24,
          ),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColor.indicatorColor),
          ),
        ],
      ),
    );
  }
}
