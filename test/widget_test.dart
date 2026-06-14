import 'package:blood_donation_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('home screen shows blood donation content', (tester) async {
    await tester.pumpWidget(const BloodDonationApp());

    expect(find.text('LifeDrop'), findsNothing);
    expect(find.text('Your blood can save lives'), findsOneWidget);
    expect(find.text('Nearby donors'), findsOneWidget);
    expect(find.text('Urgent requests'), findsOneWidget);
    expect(find.text('Donate'), findsOneWidget);
  });
}
