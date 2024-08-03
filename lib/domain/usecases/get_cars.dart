import 'package:car_rental_app/data/models/car.dart';
import 'package:car_rental_app/domain/repositories/car_repositories.dart';

class GetCars {
  final CarRepository repositories;
  GetCars(this.repositories);
  Future<List<Car>> call() async {
    return await repositories.fetchCars();
  }
}
