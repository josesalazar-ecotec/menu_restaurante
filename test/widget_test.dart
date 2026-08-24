import 'package:flutter_test/flutter_test.dart';
import 'package:menu_restaurante/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MenuApp());
    expect(find.text('Bienvenido'), findsOneWidget);
  });
}