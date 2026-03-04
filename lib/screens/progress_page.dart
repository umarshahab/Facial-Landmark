import 'package:flutter/material.dart';
import '../models/progress_model.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  // Dummy data sementara
  final List<ProgressModel> progressList = const [
    ProgressModel(date: "1 Mar", symmetry: 82, jawAngle: 125),
    ProgressModel(date: "5 Mar", symmetry: 84, jawAngle: 123),
    ProgressModel(date: "10 Mar", symmetry: 86, jawAngle: 120),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Face Progress"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // SUMMARY CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: const [
                  Text(
                    "Current Symmetry",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "86%",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // TITLE
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "History",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // LIST PROGRESS
            Expanded(
              child: ListView.builder(
                itemCount: progressList.length,
                itemBuilder: (context, index) {
                  final data = progressList[index];

                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: const Icon(Icons.face),
                      title: Text("Symmetry: ${data.symmetry}%"),
                      subtitle: Text("Jaw Angle: ${data.jawAngle}°"),
                      trailing: Text(data.date),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}