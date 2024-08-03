import 'package:car_rental_app/data/models/more_card.dart';
import 'package:car_rental_app/presentation/pages/maps_detail_page.dart';
import 'package:car_rental_app/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';

import '../../data/models/car.dart';

class CarsDetailPage extends StatefulWidget {
  final Car car;
  const CarsDetailPage({super.key, required this.car});

  @override
  State<CarsDetailPage> createState() => _CarsDetailPageState();
}

class _CarsDetailPageState extends State<CarsDetailPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });
    _controller!.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller!.forward();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info_outline,
            ),
            Text(
              "  Information",
              style: TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          CarCard(
            car: Car(
                carpimage: widget.car.carpimage,
                model: widget.car.model,
                distance: widget.car.distance,
                fuelCapacity: widget.car.fuelCapacity,
                pricePerHour: widget.car.pricePerHour),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 5,
                              blurRadius: 10)
                        ]),
                    child: const Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/Shiva.jpg"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Abhay Singh",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$4.253",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MapsDetailPage(car: widget.car)));
                    },
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                spreadRadius: 5)
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation!.value,
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/maps.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MoreCard(
                        car: Car(
                            model: "${widget.car.model}-1",
                            distance: widget.car.distance + 100,
                            fuelCapacity: widget.car.fuelCapacity + 100,
                            pricePerHour: widget.car.pricePerHour + 10,
                            carpimage: widget.car.carpimage)),
                    const SizedBox(
                      height: 5,
                    ),
                    MoreCard(
                      car: Car(
                          carpimage: widget.car.carpimage,
                          model: "${widget.car.model}-2",
                          distance: widget.car.distance + 200,
                          fuelCapacity: widget.car.fuelCapacity + 200,
                          pricePerHour: widget.car.pricePerHour + 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    MoreCard(
                      car: Car(
                          carpimage: widget.car.carpimage,
                          model: "${widget.car.model}-3",
                          distance: widget.car.distance + 300,
                          fuelCapacity: widget.car.fuelCapacity + 300,
                          pricePerHour: widget.car.pricePerHour + 30),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    MoreCard(
                      car: Car(
                          carpimage: widget.car.carpimage,
                          model: "${widget.car.model}-4",
                          distance: widget.car.distance + 400,
                          fuelCapacity: widget.car.fuelCapacity + 400,
                          pricePerHour: widget.car.pricePerHour + 40),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
