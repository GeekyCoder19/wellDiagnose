import 'package:flutter/material.dart';
import '../components/doctor_finder_controller.dart';
import 'package:provider/provider.dart';

class InteractionScreen extends StatelessWidget {
  const InteractionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final doctorFinderController =
        Provider.of<DoctorFinderController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Finder'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Search for doctors in your area:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  doctorFinderController.fetchDoctors(value);
                }
              },
              decoration: InputDecoration(
                hintText: "e.g., New York City",
                prefixIcon: const Icon(Icons.location_on),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.pink[50],
              ),
            ),
            const SizedBox(height: 20),
            if (doctorFinderController.isLoading)
              const Center(child: CircularProgressIndicator())
            else if (doctorFinderController.errorMessage.isNotEmpty)
              Center(child: Text(doctorFinderController.errorMessage))
            else if (doctorFinderController.doctorList.isEmpty)
              const Center(child: Text("No results found"))
            else
              Expanded(
                child: ListView.builder(
                  itemCount: doctorFinderController.doctorList.length,
                  itemBuilder: (context, index) {
                    final doctor = doctorFinderController.doctorList[index];
                    return Card(
                      color: Colors.pink[100],
                      child: ListTile(
                        title: Text(doctor['name'] ?? 'No Name'),
                        subtitle: Text(doctor['address'] ?? 'No Address'),
                        trailing: Text('Rating: ${doctor['rating'] ?? 'N/A'}'),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
