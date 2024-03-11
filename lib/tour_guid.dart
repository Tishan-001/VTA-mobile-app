class TourGuide {
  // Attributes
  String id;
  String name;
  String experience;
  List<String> languagesSpoken;
  double price;
  bool availability;
  String image;
  late double ratedValue;

  // Constructor
  TourGuide({
    required this.id,
    required this.name,
    required this.experience,
    required this.languagesSpoken,
    required this.price,
    required this.image,
    this.availability = false,
  });

  // Methods
  void createTourGuide() {
    print('Tour guide created: $name (ID: $id)');
  }

  void deleteTourGuide() {
    print('Tour guide deleted: $name (ID: $id)');
  }

  void modifyTourGuide({
    String? newName,
    String? newExperience,
    String? newLanguagesSpoken,
    String? newPrice,
    bool? newAvailability,
  }) {
    //TODO : create modify function
  }

  void contactCustomerSupport() {
    // Add code to contact customer support
  }

  void writeReviews() {
    // Add code to write reviews
  }
}
