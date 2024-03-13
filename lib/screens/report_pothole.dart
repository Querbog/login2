class ReportedPothole {
  final String imageUrl;
  // final String streetName;
  // final String cityName;
  // final String stateName;
  final double lat;
  final double long;
  final String dateTime;

  ReportedPothole({
    required this.imageUrl,
    required this.lat,
    required this.long,
    required this.dateTime
    // required this.streetName,
    // required this.cityName,
    // required this.stateName,
  });

  // A factory method to create ReportedPothole from JSON
  factory ReportedPothole.fromJson(Map<String, dynamic> json) {
    return ReportedPothole(
      imageUrl: json['imageUrl'],
      lat : json['lat'],
      long : json['long'],
      dateTime: json['dateTime']
      // streetName: json['streetName'],
      // cityName: json['cityName'],
      // stateName: json['stateName'],
    );
  }

  // Convert ReportedPothole object to JSON
  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'lat' : lat,
      'long' : long,
      'dateTime' : dateTime
      // 'streetName': streetName,
      // 'cityName': cityName,
      // 'stateName': stateName,
    };
  }
}