import 'package:car_rental_app/presentation/pages/cars_detail_page.dart';
import 'package:flutter/material.dart';
import '../../data/models/car.dart';

class CarCard extends StatelessWidget {
  final Car car;
  const CarCard({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CarsDetailPage(car: car)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5)
            ]),
        child: Column(
          children: [
            Image.asset(
              car.carpimage,
              height: 120,
              fit: BoxFit.fill,
            ),
            Text(
              car.model,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/gps.png"),
                        Text(
                          " ${car.distance.toStringAsFixed(0)}km   ",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset("assets/pump.png"),
                        Text(
                          " ${car.fuelCapacity.toStringAsFixed(0)}L",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
                Text(
                  "\$${car.pricePerHour.toStringAsFixed(2)}h",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
