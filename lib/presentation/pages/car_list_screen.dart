import 'package:car_rental_app/data/models/car.dart';
// import 'package:car_rental_app/presentation/bloc/car_bloc.dart';
// import 'package:car_rental_app/presentation/bloc/car_state.dart';
import 'package:car_rental_app/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class CarListScreen extends StatelessWidget {
  final List<Car> cars = [
    Car(
        model: "Fortuner GR",
        distance: 870,
        fuelCapacity: 50,
        pricePerHour: 45,
        carpimage: 'assets/car_image.png'),
    Car(
        model: "Laborghini",
        distance: 870 + 200,
        fuelCapacity: 50 + 30,
        pricePerHour: 45 + 20,
        carpimage: 'assets/lamborghini.png'),
    Car(
        model: "Bentley",
        distance: 870 + 240,
        fuelCapacity: 50 + 37,
        pricePerHour: 45 + 30,
        carpimage: 'assets/Bentley.png'),
    Car(
        model: "Porsche",
        distance: 870 + 320,
        fuelCapacity: 50 + 40,
        pricePerHour: 45 + 45,
        carpimage: 'assets/Porsche.png'),
    Car(
        model: "Audi",
        distance: 870 + 300,
        fuelCapacity: 50 + 47,
        pricePerHour: 45 + 31,
        carpimage: 'assets/Audi.png'),
  ];

  CarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Choose Your Car",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      // body: BlocBuilder<CarBloc, CarState>(builder: (context, state) {
      //   if (state is CarsLoading) {
      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   } else if (state is CarsLoaded) {
      //     return ListView.builder(
      //       itemCount: state.cars.length,
      //       itemBuilder: (context, index) {
      //         return CarCard(car: state.cars[index]);
      //       },
      //     );
      //   } else if (state is CarsError) {
      //     return Center(
      //       child: Text("error:${state.message}"),
      //     );
      //   }
      //   return Container();
      // })
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CarCard(car: cars[index]);
        },
      ),
    );
  }
}
