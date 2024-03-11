class Vehicle {
  String image;
  String topic;
  String serviceProvider;
  String overView;
  String renter;
  int reviews = 0;
  double rateValue = 0;
  int seats;
  double fuel;
  int maxSpeed;
  bool autoGear;
  int lagageBagCount;
  double rentPrice;
  late String renterImage;
  late String renterName;

  Vehicle({
    required this.image,
    required this.topic,
    required this.serviceProvider,
    required this.overView,
    required this.renter,
    required this.seats,
    required this.fuel,
    required this.maxSpeed,
    required this.autoGear,
    required this.lagageBagCount,
    required this.rentPrice,
  });
}
