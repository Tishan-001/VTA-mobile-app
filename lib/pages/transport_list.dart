import 'package:flutter/material.dart';
import 'package:vta_mobile/widgets/rates.dart';
import 'package:vta_mobile/pages/transport_item_details.dart';
import 'package:vta_mobile/vehicle.dart';

class TransportList extends StatefulWidget {
  final String transportName;
  const TransportList({super.key, required this.transportName});
  @override
  State<TransportList> createState() => _TransportListState();
}

class _TransportListState extends State<TransportList> {
  late String transportName;
  List<Vehicle> vehicleList = [];

  Vehicle vehicle = Vehicle(
      image: "Vehicle.png",
      topic: "New BMW M3",
      serviceProvider: "Kurunagala Travel",
      overView:
          "Drive your adventure with ease our vehicle rental service offers a fleet of reliable vehicles, ensuring a seamless and comfortable journey for your travel needs.",
      renter: "Amila Rathnayake",
      rentPrice: 145.00,
      seats: 5,
      autoGear: true,
      fuel: 20,
      maxSpeed: 210,
      lagageBagCount: 2);

  @override
  void initState() {
    super.initState();
    transportName = widget.transportName;

    //To fill the vehicle list from database
    vehicle.renterImage = 'vehicleRenter.png';
    vehicle.renterName = 'Amila Rathnayake';
    vehicleList = [vehicle, vehicle, vehicle, vehicle];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 0.0),
          child: Text(
            transportName,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 26.0,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xffffffff), Color(0xffd6e6f2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(
                      width: 8.0,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'What are you Looking for',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: (vehicleList.map((Vehicle vehicle) {
                    return transportItem(context, vehicle);
                  }).toList()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget transportItem(BuildContext context, Vehicle vehicle) {
  return GestureDetector(
    onTap: () => {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TransportItemDetails(vehicle: vehicle)))
    },
    child: Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: const BorderSide(color: Colors.grey, width: 2.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Image(
                image: AssetImage('assets/${vehicle.image}'),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    vehicle.topic,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8.0),
                  Text(vehicle.serviceProvider, style: TextStyle(fontSize: 10)),
                  rates(vehicle.rateValue),
                  const SizedBox(width: 8.0),
                  Text('(${vehicle.reviews})')
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
