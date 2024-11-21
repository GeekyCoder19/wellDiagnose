import 'package:flutter/material.dart';

class SymptomTile extends StatefulWidget {
  final List<String> symptoms; // List of all possible symptoms

  const SymptomTile({
    super.key,
    required this.symptoms,
  });

  @override
  _SymptomTileState createState() => _SymptomTileState();
}

class _SymptomTileState extends State<SymptomTile> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredSymptoms = [];

  @override
  void initState() {
    super.initState();
    _filteredSymptoms = widget.symptoms; // Display all initially

    // Add listener to filter symptoms as the user types
    _searchController.addListener(_filterSymptoms);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterSymptoms);
    _searchController.dispose();
    super.dispose();
  }

  void _filterSymptoms() {
    setState(() {
      _filteredSymptoms = widget.symptoms
          .where((symptom) => symptom
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Box
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: "Search for symptoms...",
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
        // Display the list of filtered symptoms
        Expanded(
          child: ListView.builder(
            itemCount: _filteredSymptoms.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Print selected symptom
                  print("Selected symptom: ${_filteredSymptoms[index]}");
                },
                child: ListTile(
                  leading:
                      const Icon(Icons.local_hospital, color: Colors.redAccent),
                  title: Text(
                    _filteredSymptoms[index],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
