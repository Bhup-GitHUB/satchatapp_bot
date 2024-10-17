import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chatbotapp/main.dart';

void main() {
  testWidgets('ChatbotApp smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the ChatScreen is rendered
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.text('Chatbot'), findsOneWidget);

    // Verify that the text input field is present
    expect(find.byType(TextField), findsOneWidget);

    // Verify that the send button is present
    expect(find.byIcon(Icons.send), findsOneWidget);

    // Enter some text and send a message
    await tester.enterText(find.byType(TextField), 'Hello, chatbot!');
    await tester.tap(find.byIcon(Icons.send));
    await tester.pump();

    // Verify that the sent message appears in the chat
    expect(find.text('Hello, chatbot!'), findsOneWidget);
  });
}