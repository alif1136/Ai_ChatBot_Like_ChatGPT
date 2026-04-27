import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ALIFChatApp());
}

class ALIFChatApp extends StatelessWidget {
  const ALIFChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ALIF ChatGPT',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const ChatScreen(),
    );
  }
}
