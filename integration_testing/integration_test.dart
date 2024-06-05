import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:form_example/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Form integration test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Find all the text fields and buttons
    final nameField = find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'Enter Your Name');
    final identityNumberField = find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'Enter Your Identity Number');
    final birthDateField = find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'Enter Your Birth Date');
    final genderField = find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'Enter Your Gender');
    final phoneNumberField = find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'Enter Your Phone Number');
    final lastEducationField = find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'Enter Your Last Education');
    final religionField = find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'Enter Your Religion');
    final jobField = find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'Enter Your Job');
    final addressField = find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'Enter Your Address');
    final accountTypeField = find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'Enter Your Account Type');
    final submitButton = find.text('Submit Data');

    // Fill out the form fields
    await tester.enterText(nameField, 'Nadia Cahya Dewi');
    await tester.enterText(identityNumberField, '20220140001');
    await tester.enterText(birthDateField, '20 april 2003');
    await tester.enterText(genderField, 'perempuan');
    await tester.enterText(phoneNumberField, '082150224691');
    await tester.enterText(lastEducationField, 'SMA');
    await tester.enterText(religionField, 'Islam');
    await tester.enterText(jobField, 'Kuliah');
    await tester.enterText(addressField, 'jogja');
    await tester.enterText(accountTypeField, 'standard');

    // Tap the submit button
    await tester.tap(submitButton);

    // Wait for the navigation animation to complete
    await tester.pumpAndSettle();

    // Verify that the ViewPage is displayed with the correct data
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