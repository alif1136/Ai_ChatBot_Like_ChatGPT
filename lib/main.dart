import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const DurjoyChatApp());
}

class DurjoyChatApp extends StatelessWidget {
  const DurjoyChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Durjoy Chat',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const ChatScreen(),
    );
  }
}
