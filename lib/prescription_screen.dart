import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/prescription_controller.dart'; // Import your PrescriptionController

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({super.key});

  @override
  _PrescriptionScreenState createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PrescriptionController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Medication Search'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter medication name:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              onSubmitted: (value) {
                controller.searchMedication(value);
              },
              decoration: InputDecoration(
                hintText: "e.g., Dolo 650",
                prefixIcon: const Icon(Icons.medication),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.blue[50],
              ),
            ),
            const SizedBox(height: 20),
            // Display search result
            if (controller.medicationResult.isNotEmpty) ...[
              const Text(
                'Search Result:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                controller.medicationResult,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
