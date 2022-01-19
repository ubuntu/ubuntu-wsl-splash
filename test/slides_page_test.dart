import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ubuntu_wsl_splash/slide.dart';
import 'package:ubuntu_wsl_splash/slides_page.dart';

void main() {
  // If the design team keep the buttons like shown in the first email, we'll
  // need to lift the slide show buttons, then the existance of this test will
  // make more sense than now.
  testWidgets('Slides Page test widget', (WidgetTester tester) async {
    const title = "Ubuntu on WSL";
    const asset = AssetImage("assets/ubuntu-on-wsl.png");

    const app = MaterialApp(
      home: SlidesPage([
        Slide(image: asset, title: title, text: "1"),
        Slide(image: asset, title: title, text: "2"),
        Slide(image: asset, title: title, text: "3"),
      ]),
    );

    await tester.pumpWidget(app);

    final rightButton = find.byIcon(Icons.chevron_right);
    expect(rightButton, findsOneWidget);
    expect(find.byIcon(Icons.chevron_left), findsNothing);
    expect(find.text("1"), findsWidgets);
    expect(find.text("2"), findsNothing);
    expect(find.image(asset), findsWidgets);

    await tester.tap(rightButton);
    await tester.pumpAndSettle();
    expect(find.text("2"), findsWidgets);
    expect(find.text("3"), findsNothing);
    expect(find.byType(ElevatedButton), findsNWidgets(2));

    await tester.tap(rightButton);
    await tester.pumpAndSettle();
    expect(find.text("3"), findsWidgets);
    expect(find.byIcon(Icons.chevron_left), findsOneWidget);
    expect(find.byIcon(Icons.chevron_right), findsNothing);
  });
}
