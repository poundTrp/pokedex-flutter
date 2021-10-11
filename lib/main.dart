import 'package:flutter/material.dart';
import 'package:pokedex_flutter/presentation/pokedex/pokedex_screen.dart';
import 'constants/defaultValue.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex app',
      theme: ThemeData(
        canvasColor: AppColor.transparent,
        primarySwatch: Colors.blue,
      ),
      home: PokedexScreen(),
    );
  }
}
