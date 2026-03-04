import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';

class HomePage extends StatelessWidget {
  final Function(int) onNavigate;

  const HomePage({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Good Morning",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "Umar",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [

                      Icon(
                        themeProvider.isDarkMode
                            ? Icons.dark_mode
                            : Icons.light_mode,
                      ),

                      Switch(
                        value: themeProvider.isDarkMode,
                        onChanged: (value) {
                          themeProvider.toggleTheme(value);
                        },
                      ),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 30),

              /// FACE SCORE CARD
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Face Balance Score",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "87%",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    /// CIRCULAR PROGRESS
                    CircularPercentIndicator(
                      radius: 40,
                      lineWidth: 8,
                      percent: 0.87,
                      animation: true,
                      progressColor: theme.primaryColor,
                      backgroundColor: Colors.grey.withOpacity(0.2),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// FEATURE CARDS
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => onNavigate(1),
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: const [
                            Icon(Icons.show_chart, size: 32),
                            SizedBox(height: 10),
                            Text("Progress"),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: InkWell(
                      onTap: () => onNavigate(2),
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          children: const [
                            Icon(Icons.smart_toy, size: 32),
                            SizedBox(height: 10),
                            Text("AI Chatbot"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// WEEKLY PROGRESS
              const Text(
                "Weekly Progress",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              LinearProgressIndicator(
                value: 0.7,
                minHeight: 10,
                borderRadius: BorderRadius.circular(20),
                backgroundColor: Colors.grey.withOpacity(0.2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
