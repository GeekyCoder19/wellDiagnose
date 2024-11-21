class Doctor {
  final String placeId; // Unique ID from Google Places API
  final String name;
  final String address;
  final String phoneNumber;
  final double rating;
  final List<String> types;

  Doctor({
    required this.placeId,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.rating,
    required this.types,
  });

  // Factory constructor to create a Doctor object from a Map (e.g., from Places API JSON response)
  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      placeId: map['place_id'] as String,
      name: map['name'] as String,
      address: map['formatted_address'] as String? ?? 'Address not available',
      phoneNumber: map['formatted_phone_number'] as String? ?? 'N/A',
      rating: (map['rating'] as num?)?.toDouble() ?? 0.0,
      types: List<String>.from(map['types'] ?? []),
    );
  }

  // Convert Doctor object to Map (useful for caching or debugging purposes)
  Map<String, dynamic> toMap() {
    return {
      'place_id': placeId,
      'name': name,
      'address': address,
      'phone_number': phoneNumber,
      'rating': rating,
      'types': types,
    };
  }
}
