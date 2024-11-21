import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/prescription_controller.dart'; // Import PrescriptionController
import 'controllers/diagnosis_controller.dart'; // Import DiagnosisController
import 'home_screen.dart'; // Your home screen widget
import 'diagnosis_screen.dart'; // Your Diagnosis screen widget
import 'prescription_screen.dart'; // Your Prescription screen widget
import 'interaction_screen.dart'; // Your Interaction screen widget
import '../components/doctor_finder_controller.dart'; // Import DoctorFinderController

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PrescriptionController(), // Provide PrescriptionController
        ),
        ChangeNotifierProvider(
          create: (_) => DiagnosisController(), // Provide DiagnosisController
        ),
        ChangeNotifierProvider(
          create: (_) => DoctorFinderController(), // Provide DoctorFinderController
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Well Diagnose App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(), // Home screen is the initial screen
      routes: {
        '/diagnosis': (context) => const DiagnosisScreen(), // Diagnosis route
        '/prescription': (context) =>
            const PrescriptionScreen(), // Prescription route
        '/interaction': (context) => const InteractionScreen(), // Interaction route
      },
    );
  }
}
