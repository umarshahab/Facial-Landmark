import 'package:faceup/screens/chatbot_page.dart';
import 'package:faceup/screens/progress_page.dart';
import 'package:flutter/material.dart';
import 'screens/main_navigation.dart';

void main() {
  runApp(const FaceUpApp());
}

class FaceUpApp extends StatelessWidget {
  const FaceUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,

      home: const MainNavigation(),

      routes: { 
        '/progress': (context) => const ProgressPage(),
        '/chatbot': (context) => const ChatbotPage(),
      },
    );
  }
}
