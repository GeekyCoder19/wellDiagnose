class Medication {
  final int id;
  final String medicationName;
  final String genericName;
  final String manufacturer;
  final String uses;
  final String dosage;

  Medication({
    required this.id,
    required this.medicationName,
    required this.genericName,
    required this.manufacturer,
    required this.uses,
    required this.dosage,
  });

  // Factory constructor to create a Medication object from a Map
  factory Medication.fromMap(Map<String, dynamic> map) {
    return Medication(
      id: map['id'] as int,
      medicationName: map['medication_name'] as String,
      genericName: map['generic_name'] as String,
      manufacturer: map['manufacturer'] as String,
      uses: map['uses'] as String,
      dosage: map['dosage'] as String,
    );
  }

  // Convert Medication object to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'medication_name': medicationName,
      'generic_name': genericName,
      'manufacturer': manufacturer,
      'uses': uses,
      'dosage': dosage,
    };
  }
}
