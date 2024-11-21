-- SQL script to initialize database tables for the Well Diagnose app

-- Table to store symptoms and their related conditions
CREATE TABLE IF NOT EXISTS Symptoms (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    symptom_name TEXT NOT NULL UNIQUE,
    condition TEXT NOT NULL
);

-- Sample data for the Symptoms table
INSERT OR IGNORE INTO Symptoms (symptom_name, condition) VALUES 
('running nose', 'Common Cold'),
('cough', 'Flu'),
('fever', 'Influenza'),
('headache', 'Migraine'),
('fatigue', 'Anemia'),
('sore throat', 'Strep Throat'),
('nausea', 'Food Poisoning'),
('body aches', 'Viral Fever'),
('chest pain', 'Angina'),
('shortness of breath', 'Asthma');

-- Table to store medication information
CREATE TABLE IF NOT EXISTS Medications (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    medication_name TEXT NOT NULL UNIQUE,
    generic_name TEXT NOT NULL,
    manufacturer TEXT NOT NULL,
    uses TEXT,
    dosage TEXT
);

-- Sample data for the Medications table
INSERT OR IGNORE INTO Medications (medication_name, generic_name, manufacturer, uses, dosage) VALUES 
('Dolo 650', 'Acetaminophen', 'MicroLabs Limited', 'Headaches, muscle aches, fever', '650 mg'),
('Aspirin', 'Acetylsalicylic Acid', 'Bayer', 'Pain relief, fever, anti-inflammatory', '300 mg'),
('Amoxicillin', 'Amoxicillin', 'GSK', 'Bacterial infections', '500 mg'),
('Metformin', 'Metformin Hydrochloride', 'Sun Pharmaceuticals', 'Diabetes type 2 management', '500 mg'),
('Ibuprofen', 'Ibuprofen', 'Advil', 'Pain relief, fever', '400 mg'),
('Omeprazole', 'Omeprazole', 'AstraZeneca', 'Acid reflux, GERD', '20 mg'),
('Lisinopril', 'Lisinopril', 'Zestril', 'Hypertension', '10 mg'),
('Paracetamol', 'Acetaminophen', 'Cipla', 'Pain relief, fever', '500 mg'),
('Atorvastatin', 'Atorvastatin', 'Pfizer', 'Cholesterol management', '10 mg'),
('Cetirizine', 'Cetirizine Hydrochloride', 'Dr. Reddy’s', 'Allergies', '10 mg');

-- Table to store doctor and hospital information
CREATE TABLE IF NOT EXISTS Doctors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    specialization TEXT NOT NULL,
    address TEXT NOT NULL,
    contact TEXT,
    rating REAL
);

-- Sample data for the Doctors table
INSERT OR IGNORE INTO Doctors (name, specialization, address, contact, rating) VALUES 
('Dr. Sarah Lee', 'General Physician', '123 Main St, City Center', '123-456-7890', 4.5),
('Dr. John Doe', 'Cardiologist', '45 Heart Avenue, Medical Park', '321-654-0987', 4.8),
('Dr. Emily Brown', 'Dermatologist', '98 Skin St, Wellness Plaza', '987-654-3210', 4.3),
('Dr. Michael Smith', 'Pediatrician', '67 Kids Lane, Family Clinic', '456-123-7890', 4.6),
('Dr. Laura Green', 'Oncologist', '23 Cancer Care Rd, Hope Hospital', '789-012-3456', 4.7),
('Dr. Mark Davis', 'Orthopedic Surgeon', '10 Bone Rd, Health Center', '654-321-0987', 4.4),
('Dr. Anna Scott', 'ENT Specialist', '111 Nose Lane, Medical Park', '111-222-3333', 4.2),
('Dr. David Wong', 'Gastroenterologist', '45 Gut Avenue, Wellness Plaza', '999-888-7777', 4.6),
('Dr. Rachel Lee', 'Endocrinologist', '78 Hormone St, City Center', '888-777-6666', 4.5),
('Dr. Chris Tan', 'Neurologist', '56 Brain Blvd, Specialist Clinic', '555-444-3333', 4.7);

-- Query index to speed up searches on symptom and medication names
CREATE INDEX IF NOT EXISTS idx_symptom_name ON Symptoms (symptom_name);
CREATE INDEX IF NOT EXISTS idx_medication_name ON Medications (medication_name);
CREATE INDEX IF NOT EXISTS idx_doctor_specialization ON Doctors (specialization);
