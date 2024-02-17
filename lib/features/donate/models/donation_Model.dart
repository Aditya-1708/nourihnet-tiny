class DonationModel {
  final String? id;
  final String foodServings;
  final String timings;
  final String location;

  DonationModel({
    this.id,
    required this.foodServings,
    required this.timings,
    required this.location,
  });

  toJson() {
    return {
      'id': id,
      'foodServings': foodServings,
      'timings': timings,
      'location': location,
    };
  }
}
