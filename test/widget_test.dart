import 'package:deliii/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Delibox splash screen renders', (tester) async {
    await tester.pumpWidget(const DeliboxApp());

    expect(find.text('DELIBOX'), findsOneWidget);
    expect(find.text('Smart Locker System'), findsOneWidget);
  });
}
