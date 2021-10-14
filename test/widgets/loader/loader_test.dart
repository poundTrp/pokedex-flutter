import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_flutter/presentation/widgets/loader.dart';

void main() {
  testWidgets('Loader render correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: [
            Loader(
              loadingMessage: '',
            ),
          ],
        ),
      ),
    );
    await tester.pump();
    final loadingAnimationKey = find.byKey(Key('LoadingAnimationKey'));
    expect(loadingAnimationKey, findsOneWidget);
  });
}
