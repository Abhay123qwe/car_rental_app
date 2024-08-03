class Car {
  final String carpimage;
  final String model;
  final double distance;
  final double fuelCapacity;
  final double pricePerHour;

  Car({
    required this.carpimage,
    required this.model,
    required this.distance,
    required this.fuelCapacity,
    required this.pricePerHour,
  });

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      carpimage: map['carpimage'],
      model: map['model'],
      distance: map['distance'],
      fuelCapacity: map['fuelCapacity'],
      pricePerHour: map['pricePerHour'],
    );
  }
}
