import 'package:flutter/material.dart';
import 'medication_model.dart'; // Import your Medication model

class PrescriptionController with ChangeNotifier {
  String _medicationResult = '';
  String get medicationResult => _medicationResult;

  // Predefined medications
  final Map<String, Medication> _predefinedMedications = {};

  PrescriptionController() {
    _initializeMedications();
  }

  // Initialize medications with a comprehensive list
  void _initializeMedications() {
    final medicationsList = [
      Medication(
        id: 1,
        medicationName: "Dolo 650",
        genericName: "Acetaminophen",
        manufacturer: "MicroLabs Limited",
        uses: "Headaches, Muscle Aches, Fever",
        dosage: "650 mg",
      ),
      Medication(
        id: 2,
        medicationName: "Aspirin",
        genericName: "Acetylsalicylic Acid",
        manufacturer: "Bayer",
        uses: "Pain Relief, Fever, Inflammation, Blood Thinner",
        dosage: "81 mg",
      ),
      Medication(
        id: 3,
        medicationName: "Paracetamol",
        genericName: "Acetaminophen",
        manufacturer: "GlaxoSmithKline",
        uses: "Pain Relief, Fever",
        dosage: "500 mg",
      ),
      Medication(
        id: 4,
        medicationName: "Amoxicillin",
        genericName: "Amoxicillin",
        manufacturer: "Pfizer",
        uses: "Bacterial Infections, Pneumonia, Sinus Infections",
        dosage: "500 mg",
      ),
      Medication(
        id: 5,
        medicationName: "Ciprofloxacin",
        genericName: "Ciprofloxacin",
        manufacturer: "Bayer",
        uses: "Urinary Tract Infections, Bacterial Infections",
        dosage: "250 mg",
      ),
      Medication(
        id: 6,
        medicationName: "Ibuprofen",
        genericName: "Ibuprofen",
        manufacturer: "Johnson & Johnson",
        uses: "Pain Relief, Inflammation, Fever",
        dosage: "200 mg",
      ),
      Medication(
        id: 7,
        medicationName: "Lisinopril",
        genericName: "Lisinopril",
        manufacturer: "Merck",
        uses: "High Blood Pressure, Heart Failure",
        dosage: "10 mg",
      ),
      Medication(
        id: 8,
        medicationName: "Atorvastatin",
        genericName: "Atorvastatin",
        manufacturer: "Pfizer",
        uses: "Cholesterol Management",
        dosage: "40 mg",
      ),
      Medication(
        id: 9,
        medicationName: "Metformin",
        genericName: "Metformin",
        manufacturer: "Bristol-Myers Squibb",
        uses: "Diabetes, Blood Sugar Control",
        dosage: "500 mg",
      ),
      Medication(
        id: 10,
        medicationName: "Losartan",
        genericName: "Losartan",
        manufacturer: "Merck",
        uses: "High Blood Pressure, Heart Failure",
        dosage: "50 mg",
      ),
      Medication(
        id: 11,
        medicationName: "Omeprazole",
        genericName: "Omeprazole",
        manufacturer: "AstraZeneca",
        uses: "Acid Reflux, Gastritis, Heartburn",
        dosage: "20 mg",
      ),
      Medication(
        id: 12,
        medicationName: "Tamsulosin",
        genericName: "Tamsulosin",
        manufacturer: "Boehringer Ingelheim",
        uses: "Benign Prostatic Hyperplasia (BPH), Urinary Retention",
        dosage: "0.4 mg",
      ),
      Medication(
        id: 13,
        medicationName: "Zoloft",
        genericName: "Sertraline",
        manufacturer: "Pfizer",
        uses: "Depression, Anxiety, Panic Attacks",
        dosage: "50 mg",
      ),
      Medication(
        id: 14,
        medicationName: "Citalopram",
        genericName: "Citalopram",
        manufacturer: "Forest Laboratories",
        uses: "Depression, Anxiety",
        dosage: "10 mg",
      ),
      Medication(
        id: 15,
        medicationName: "Prednisone",
        genericName: "Prednisone",
        manufacturer: "Pfizer",
        uses: "Inflammation, Autoimmune Disorders",
        dosage: "5 mg",
      ),
      // Add more medications as necessary
    ];

    for (var medication in medicationsList) {
      _predefinedMedications[medication.medicationName.toLowerCase()] = medication;
    }
  }

  // Search for medication by name
  void searchMedication(String medicationName) {
    final medication = _predefinedMedications[medicationName.toLowerCase()];
    if (medication != null) {
      _medicationResult = '''
Medicine Name: ${medication.medicationName}
Generic Name: ${medication.genericName}
Manufacturer: ${medication.manufacturer}
Uses: ${medication.uses}
Dosage: ${medication.dosage}
''';
    } else {
      _medicationResult = "Medication not found. Please try another name.";
    }
    notifyListeners();
  }

  // Clear search result
  void clearMedicationResult() {
    _medicationResult = '';
    notifyListeners();
  }
}
