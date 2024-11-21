import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api_constants.dart';

class DoctorFinderController with ChangeNotifier {
  List<Map<String, String>> _doctorList = [];
  List<Map<String, String>> get doctorList => _doctorList;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Fetch doctors or hospitals based on user-entered area
  Future<void> fetchDoctors(String area) async {
    _isLoading = true;
    _errorMessage = '';
    _doctorList = [];
    notifyListeners();

    // Use a different CORS proxy: AllOrigins
    final apiUrl = 'https://api.allorigins.win/get?url=' +
        Uri.encodeComponent(
            'https://maps.googleapis.com/maps/api/place/textsearch/json?query=doctor+in+$area&key=${ApiConstants.apiKey}');

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Decode the response returned by the proxy
        final decodedResponse = jsonDecode(data['contents']);

        if (decodedResponse['results'] != null) {
          _doctorList = List<Map<String, String>>.from(
              decodedResponse['results'].map((dynamic result) {
            // Safely cast each result to a Map<String, String>
            return {
              'name': result['name']?.toString() ?? 'Unknown',
              'address':
                  result['formatted_address']?.toString() ?? 'No Address',
              'rating': (result['rating'] != null)
                  ? result['rating'].toString()
                  : 'N/A',
            };
          }));
        } else {
          _errorMessage = 'No doctors found in the specified area.';
        }
      } else {
        _errorMessage = 'Failed to load data: ${response.reasonPhrase}';
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
