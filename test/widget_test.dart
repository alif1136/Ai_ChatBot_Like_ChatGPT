import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:durjoy_chat/main.dart';

void main() {
  testWidgets('App boots and shows welcome screen', (WidgetTester tester) async {
    await tester.pumpWidget(const ALIFChatApp());

    expect(find.text("Hi, I'm ALIF"), findsOneWidget);
    expect(find.text('Ask me anything to get started.'), findsOneWidget);
  });
}