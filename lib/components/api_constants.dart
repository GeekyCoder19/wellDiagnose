class ApiConstants {
  static const String apiKey = 'Random';

  static String baseUrl(String area) {
    return 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=doctor+in+$area&key=$apiKey';
  }
}
