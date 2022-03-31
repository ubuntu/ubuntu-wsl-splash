import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ubuntu_wsl_splash/slide.dart';
import 'package:ubuntu_wsl_splash/slides_page.dart';

void main() {
  // If the design team keep the buttons like shown in the first email, we'll
  // need to lift the slide show buttons, then the existance of this test will
  // make more sense than now.
  testWidgets('Slides Page test widget', (WidgetTester tester) async {
    const title = "Welcome to Ubuntu WSL";
    const subtitle = "Ubuntu on WSL";
    final asset = Image.asset("assets/ubuntu-on-wsl.png");
    const bottomText = "This is a test";

    final app = MaterialApp(
      home: SlidesPage(
        [
          Slide(image: asset, title: title, subtitle: subtitle, text: "1"),
          Slide(image: asset, title: title, subtitle: subtitle, text: "2"),
          Slide(image: asset, title: title, subtitle: subtitle, text: "3"),
          Slide.withRichText(
              image: asset,
              title: title,
              subtitle: subtitle,
              span: const [TextSpan(text: "4")]),
        ],
        bottom: const Text(bottomText),
      ),
    );

    await tester.pumpWidget(app);
    expect(find.text(bottomText), findsOneWidget);

    final rightButton = find.byIcon(Icons.chevron_right);
    expect(rightButton, findsOneWidget);
    expect(find.byIcon(Icons.chevron_left), findsNothing);
    expect(find.text("1"), findsWidgets);
    expect(find.text("2"), findsNothing);
    expect(find.image(asset.image), findsWidgets);

    await tester.tap(rightButton);
    await tester.pumpAndSettle();
    expect(find.text("2"), findsWidgets);
    expect(find.text("3"), findsNothing);
    expect(find.byType(ElevatedButton), findsNWidgets(2));

    await tester.tap(rightButton);
    await tester.pumpAndSettle();
    expect(find.text("3"), findsWidgets);
    expect(find.byIcon(Icons.chevron_left), findsOneWidget);
    expect(find.byIcon(Icons.chevron_right), findsOneWidget);

    await tester.tap(rightButton);
    await tester.pumpAndSettle();
    expect(
        find.byWidgetPredicate(
            (widget) => _fromRichTextToPlainText(widget) == "4"),
        findsWidgets);
    expect(find.byIcon(Icons.chevron_left), findsOneWidget);
    expect(find.byIcon(Icons.chevron_right), findsNothing);
  });
}

String? _fromRichTextToPlainText(final Widget widget) {
  if (widget is RichText) {
    return widget.text.toPlainText();
  }
  return null;
}
