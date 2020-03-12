import 'package:bytebank/components/menu.dart';
import 'package:bytebank/views/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets('Should display the main image when the Dashboard is open', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Dashboard()
      )
    );
    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);
  });

  testWidgets('Should display the first feature when the Dashboard is open', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Dashboard()
      )
    );
    final firstFeature = find.byType(MenuItem);
    expect(firstFeature, findsWidgets);
  });
}