class Symptom {
  final int id;
  final String symptomName;
  final String condition;

  Symptom({
    required this.id,
    required this.symptomName,
    required this.condition,
  });

  // Factory constructor to create a Symptom object from a Map
  factory Symptom.fromMap(Map<String, dynamic> map) {
    return Symptom(
      id: map['id'] as int,
      symptomName: map['symptom_name'] as String,
      condition: map['condition'] as String,
    );
  }

  // Convert Symptom object to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'symptom_name': symptomName,
      'condition': condition,
    };
  }
}
