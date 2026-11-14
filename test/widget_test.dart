import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:three_pages/main.dart';

void main() {
  testWidgets('Home shows its name, an image, and an icon', (tester) async {
    await tester.pumpWidget(const ThreePagesApp());

    expect(find.text('Home'), findsWidgets);
    expect(find.byIcon(Icons.home), findsWidgets);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets('Home button opens About, then About button opens Contact', (
    tester,
  ) async {
    await tester.pumpWidget(const ThreePagesApp());

    await tester.ensureVisible(find.text('Go to About'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Go to About'));
    await tester.pumpAndSettle();
    expect(find.text('About'), findsWidgets);
    expect(find.text('Go to Contact'), findsOneWidget);

    await tester.tap(find.text('Go to Contact'));
    await tester.pumpAndSettle();
    expect(find.text('Contact'), findsWidgets);
    expect(find.text('hello@example.com'), findsOneWidget);
  });

  testWidgets('Bottom bar opens each page', (tester) async {
    await tester.pumpWidget(const ThreePagesApp());

    await tester.tap(find.text('About'));
    await tester.pumpAndSettle();
    expect(find.text('Go to Contact'), findsOneWidget);

    await tester.tap(find.text('Contact'));
    await tester.pumpAndSettle();
    expect(find.text('hello@example.com'), findsOneWidget);

    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();
    expect(find.text('Go to About'), findsOneWidget);
  });
}
