import 'package:blood_donation_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('home screen shows blood donation dashboard content', (tester) async {
    await tester.pumpWidget(const BloodDonationApp());

    expect(find.text('Your blood can save lives'), findsOneWidget);
    expect(find.text('Nearby donors'), findsOneWidget);
    expect(find.text('Urgent requests'), findsOneWidget);
    expect(find.text('Upcoming drives'), findsOneWidget);
    expect(find.text('Donate'), findsOneWidget);
  });

  testWidgets('bottom navigation opens donor search screen', (tester) async {
    await tester.pumpWidget(const BloodDonationApp());

    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();

    expect(find.text('Find a donor'), findsOneWidget);
    expect(find.text('Best matches near you'), findsOneWidget);
  });
}
