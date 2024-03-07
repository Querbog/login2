class ReportedPothole {
  final String imageUrl;
  final String streetName;
  final String cityName;
  final String stateName;

  ReportedPothole({
    required this.imageUrl,
    required this.streetName,
    required this.cityName,
    required this.stateName,
  });

  // A factory method to create ReportedPothole from JSON
  factory ReportedPothole.fromJson(Map<String, dynamic> json) {
    return ReportedPothole(
      imageUrl: json['imageUrl'],
      streetName: json['streetName'],
      cityName: json['cityName'],
      stateName: json['stateName'],
    );
  }

  // Convert ReportedPothole object to JSON
  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'streetName': streetName,
      'cityName': cityName,
      'stateName': stateName,
    };
  }
}