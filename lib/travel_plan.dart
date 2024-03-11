class TravelPlan {
  String title;
  String description;
  List<String> images;
  String places;
  String accommodation;
  String transportation;
  double rate = 0;
  int reviews = 0;
  TravelPlan({
    required this.title,
    required this.description,
    required this.images,
    required this.places,
    required this.accommodation,
    required this.transportation,
  });
}
