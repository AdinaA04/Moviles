import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('La app empieza en la Pantalla 1', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Pantalla 1'), findsOneWidget);
    expect(find.text('Ir a la pantalla 3'), findsOneWidget);
    expect(find.text('Ir a la pantalla 4'), findsOneWidget);
  });
}
