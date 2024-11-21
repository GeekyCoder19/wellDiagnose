import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DiagnosisController with ChangeNotifier {
  final List<String> _symptoms = [];
  List<String> _availableSymptoms = [];
  String _diagnosisResult = '';

  List<String> get symptoms => _symptoms;
  List<String> get availableSymptoms => _availableSymptoms;
  String get diagnosisResult => _diagnosisResult;

  // Load symptoms data from a local file
  Future<void> loadSymptomsData() async {
    try {
      final String response =
          await rootBundle.loadString('assets/symptoms_data.txt');
      final List<dynamic> data = jsonDecode(response);
      _availableSymptoms = List<String>.from(data);
      notifyListeners();
    } catch (e) {
      print("Error loading symptoms data: $e");
    }
  }

  // Add a symptom and get the diagnosis
  void addSymptom(String symptom) {
    if (!_symptoms.contains(symptom)) {
      _symptoms.add(symptom);
      _updateDiagnosis();
    }
  }

  // Clear the symptoms list
  void clearSymptoms() {
    _symptoms.clear();
    _diagnosisResult = '';
    notifyListeners();
  }

  // Update diagnosis based on predefined symptom-disease mapping
  void _updateDiagnosis() {
    if (_symptoms.isEmpty) {
      _diagnosisResult = "Please enter symptoms to get a diagnosis.";
    } else {
      Map<String, List<String>> symptomDiseaseMapping = {
        'sneezing': ['Common Cold', 'Allergic Reaction'],
        'sore throat': ['Common Cold', 'Flu'],
        'runny nose': ['Common Cold', 'Sinusitis'],
        'coughing': ['Bronchitis', 'Pneumonia'],
        'headache': ['Migraine', 'Flu', 'Sinusitis'],
        'fever': ['Flu', 'COVID-19', 'Dengue Fever', 'Malaria'],
        'rash': ['Allergic Reaction', 'Chickenpox', 'Measles'],
        'joint pain': ['Arthritis', 'Gout', 'Dengue Fever'],
        'shortness of breath': ['Asthma', 'Pneumonia', 'COVID-19'],
        'nausea': ['Gastroenteritis', 'Migraine', 'Pancreatitis'],
        'vomiting': ['Gastroenteritis', 'Pancreatitis', 'Malaria'],
        'abdominal pain': ['Appendicitis', 'Gallstones', 'Gastroenteritis'],
        'diarrhea': ['Cholera', 'Gastroenteritis'],
        'weight loss': ['Diabetes', 'Tuberculosis', 'Cancer'],
      };

      List<String> possibleDiseases = [];
      for (var symptom in _symptoms) {
        if (symptomDiseaseMapping.containsKey(symptom)) {
          possibleDiseases.addAll(symptomDiseaseMapping[symptom]!);
        }
      }

      // Remove duplicates and update the diagnosis result
      if (possibleDiseases.isNotEmpty) {
        possibleDiseases = possibleDiseases.toSet().toList();
        _diagnosisResult =
            "Possible conditions based on the symptoms: ${possibleDiseases.join(', ')}";
      } else {
        _diagnosisResult =
            "No matching diagnosis found for the given symptoms. Please consult a doctor.";
      }
    }
    notifyListeners();
  }
}
