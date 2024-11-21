import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/diagnosis_controller.dart';

class DiagnosisScreen extends StatefulWidget {
  const DiagnosisScreen({super.key});

  @override
  _DiagnosisScreenState createState() => _DiagnosisScreenState();
}

class _DiagnosisScreenState extends State<DiagnosisScreen> {
  @override
  void initState() {
    super.initState();
    // Load symptoms data when the screen initializes
    Provider.of<DiagnosisController>(context, listen: false).loadSymptomsData();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DiagnosisController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Symptom Checker'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Enter your symptoms:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              onSubmitted: (value) {
                controller.addSymptom(value);
              },
              decoration: InputDecoration(
                hintText: "e.g., headache, fever",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.orange[50],
              ),
            ),
            const SizedBox(height: 20),
            // Display diagnosis result below the search box
            Text(
              controller.diagnosisResult,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
