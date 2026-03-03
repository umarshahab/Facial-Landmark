import 'package:flutter/material.dart';
import 'home_page.dart';
import 'progress_page.dart';
import 'chatbot_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    final List<Widget> pages = [
      HomePage(
        onNavigate: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      const ProgressPage(),
      const ChatbotPage(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.show_chart), label: "Progress"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble), label: "Chatbot"),
        ],
      ),
    );
  }
}