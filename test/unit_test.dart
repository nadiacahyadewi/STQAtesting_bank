import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_example/view_page.dart';

void main() {
  testWidgets('input benar', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: ViewPage(
          name: 'Nadia Cahya Dewi',
          identitynumber: '20220140001',
          birthdate: '20 april 2003',
          gender: 'perempuan',
          phonenumber: '082150224691',
          lasteducation: 'SMA',
          religion: 'Islam',
          job: 'Kuliah',
          address: 'jogja',
          accounttype: 'standard',
        ),
      ),
    );

    expect(find.text('Name: Nadia Cahya Dewi'), findsOneWidget);
    expect(find.text('Identity Number: 20220140001'), findsOneWidget);
    expect(find.text('Birht Date: 20 april 2003'), findsOneWidget);  // Note the typo in "Birht Date"
    expect(find.text('Gender: perempuan'), findsOneWidget);
    expect(find.text('Phone Number: 082150224691'), findsOneWidget);
    expect(find.text('Last Education: SMA'), findsOneWidget);
    expect(find.text('Religion: Islam'), findsOneWidget);
    expect(find.text('Job: Kuliah'), findsOneWidget);
    expect(find.text('Address: jogja'), findsOneWidget);
    expect(find.text('Account Type: standard'), findsOneWidget);
    });
}