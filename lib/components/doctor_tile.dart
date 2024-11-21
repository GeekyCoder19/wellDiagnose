import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'doctor_finder_controller.dart';

class DoctorTile extends StatelessWidget {
  const DoctorTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Box for doctors
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onSubmitted: (value) {
              // Trigger search when text is submitted
              if (value.isNotEmpty) {
                Provider.of<DoctorFinderController>(context, listen: false)
                    .fetchDoctors(value);
              }
            },
            decoration: InputDecoration(
              hintText: "Search for doctors or hospitals in your area",
              prefixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey[400]!),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
        ),
        // Display the loading, error, or results
        Consumer<DoctorFinderController>(
          builder: (context, controller, child) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.errorMessage.isNotEmpty) {
              return Center(child: Text(controller.errorMessage));
            }
            if (controller.doctorList.isEmpty) {
              return const Center(child: Text("No results found"));
            }
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.doctorList.length,
                itemBuilder: (context, index) {
                  final doctor = controller.doctorList[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(doctor['name'] ?? 'No Name'),
                      subtitle: Text(doctor['address'] ?? 'No Address'),
                      trailing: Text(
                        doctor['rating'] ?? 'N/A',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
