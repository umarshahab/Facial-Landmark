import 'package:faceup/screens/chatbot_page.dart';
import 'package:faceup/screens/progress_page.dart';
import 'package:flutter/material.dart';
import 'screens/main_navigation.dart';
import 'package:provider/provider.dart';
import 'theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const FaceUpApp(),
    ),
  );
} 
class FaceUpApp extends StatelessWidget {
  const FaceUpApp({super.key});

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF4A90E2),
        scaffoldBackgroundColor: const Color(0xFFF4F6FA),
        cardColor: Colors.white,
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF4A90E2),
        scaffoldBackgroundColor: const Color(0xFF121212),
        cardColor: const Color(0xFF1E1E1E),
      ),

      /// INI YANG HARUS DIGANTI
      themeMode: themeProvider.themeMode,

      home: const MainNavigation(),

      routes: {
        '/progress': (context) => const ProgressPage(),
        '/chatbot': (context) => const ChatbotPage(),
      },
    );
  }
} 