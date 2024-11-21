import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../controllers/medication_model.dart';
import '../models/symptom_model.dart';

class DBHelper {
  static Database? _database;

  // Database initialization
  static Future<void> initDatabase() async {
    if (_database != null) return;
    try {
      String path = join(await getDatabasesPath(), 'well_diagnose.db');
      _database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE Medications (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT,
              manufacturer TEXT,
              usage TEXT,
              dosage TEXT
            )
          ''');

          await db.execute('''
            CREATE TABLE Symptoms (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              symptom TEXT,
              diagnosis TEXT
            )
          ''');
        },
      );
    } catch (e) {
      print("Error initializing database: $e");
    }
  }

  // Insert medication
  static Future<void> insertMedication(Medication medication) async {
    await _database?.insert('Medications', medication.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Insert symptom
  static Future<void> insertSymptom(Symptom symptom) async {
    await _database?.insert('Symptoms', symptom.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Get medication by name
  static Future<Medication?> getMedication(String name) async {
    final List<Map<String, dynamic>> results = await _database!.query(
      'Medications',
      where: 'name = ?',
      whereArgs: [name],
    );
    if (results.isNotEmpty) {
      return Medication.fromMap(results.first);
    }
    return null;
  }

  // Get diagnosis by symptom
  static Future<String?> getDiagnosis(String symptom) async {
    final List<Map<String, dynamic>> results = await _database!.query(
      'Symptoms',
      where: 'symptom = ?',
      whereArgs: [symptom],
    );
    if (results.isNotEmpty) {
      return results.first['diagnosis'] as String?;
    }
    return null;
  }
}
