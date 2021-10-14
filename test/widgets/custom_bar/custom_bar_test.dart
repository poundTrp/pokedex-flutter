import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:pokedex_flutter/presentation/widgets/custom_bar.dart';

void main() {
  const screenSize = Size(400, 80);

  testGoldens('render correctly', (tester) async {
    await tester.pumpWidgetBuilder(
      CustomBar(),
      surfaceSize: screenSize,
    );

    await screenMatchesGolden(tester, 'custom_bar');
  });
}
