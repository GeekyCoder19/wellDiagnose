class ApiConstants {
  static const String apiKey = 'AIzaSyBPk2i5hxX6QognnJw8kmEFNUUTFXS-NEw';

  static String baseUrl(String area) {
    return 'https://maps.googleapis.com/maps/api/place/textsearch/json?query=doctor+in+$area&key=$apiKey';
  }
}
