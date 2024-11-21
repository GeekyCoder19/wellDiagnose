import 'dart:convert';
import 'package:flutter/services.dart';

// Load symptom data from assets
Future<Map<String, List<String>>> loadSymptomData() async {
  String data = await rootBundle.loadString('assets/symptoms_data.txt');
  // Decode the data as a Map<String, List<String>>
  Map<String, dynamic> jsonData = jsonDecode(data);
  // Map the values to List<String> explicitly
  return jsonData.map((key, value) => MapEntry(key, List<String>.from(value)));
}

// Load medication data from assets
Future<List<Map<String, dynamic>>> loadMedicationData() async {
  String data = await rootBundle.loadString('assets/medications_data.txt');
  List<dynamic> jsonData = jsonDecode(data);
  // Map each item into a more specific structure
  return jsonData.map((item) {
    return {
      'medicine_name': item['medicine_name'],
      'generic_name': item['generic_name'],
      'manufacturer': item['manufacturer'],
      'uses': List<String>.from(item['uses']),
      'dosage': item['dosage']
    };
  }).toList();
}

// Search for symptoms from the loaded data
Future<List<String>> searchSymptoms(String input) async {
  // Expect Map<String, List<String>> for symptoms
  Map<String, List<String>> symptoms = await loadSymptomData();
  // Check if the key exists, then return its values, otherwise return a default message
  return symptoms[input.toLowerCase()] ?? ["No matching disease found."];
}

// Search for medications from the loaded data
Future<Map<String, dynamic>> searchMedications(String input) async {
  List<Map<String, dynamic>> medications = await loadMedicationData();
  // Perform the search, case-insensitive
  var medication = medications.firstWhere(
    (med) => med['medicine_name']!.toLowerCase() == input.toLowerCase(),
    orElse: () => {},
  );
  return medication.isNotEmpty ? medication : {'error': 'Medication not found'};
}
