import 'package:flutter/material.dart';
import 'package:vta_mobile/widgets/rates.dart';
import 'package:vta_mobile/vehicle.dart';

class TransportItemDetails extends StatefulWidget {
  final Vehicle vehicle;
  const TransportItemDetails({super.key, required this.vehicle});
  @override
  State<TransportItemDetails> createState() => _TransportItemDetailsState();
}

class _TransportItemDetailsState extends State<TransportItemDetails> {
  late Vehicle vehicle;

  @override
  void initState() {
    super.initState();
    vehicle = widget.vehicle;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 25.0,
            horizontal: 25.0,
          ),
          child: Text(
            widget.vehicle.topic,
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
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (widget.vehicle.image.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: SizedBox(
                    width: 327,
                    height: 255,
                    child: Expanded(
                      child: Image(
                        image: AssetImage('assets/${vehicle.image}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

              // Details of the transpotation item
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Overview',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(vehicle.overView),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: .0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //TODO: add condition details of the vehicle
                        children: [
                          Expanded(
                              child: Image(
                            height: 50,
                            fit: BoxFit.contain,
                            image: AssetImage(
                                'assets/vehicle_condition_images/seats.png'),
                          )),
                          Expanded(
                              child: Image(
                            fit: BoxFit.contain,
                            height: 50,
                            image: AssetImage(
                                'assets/vehicle_condition_images/fuel.png'),
                          )),
                          Expanded(
                              child: Image(
                            fit: BoxFit.contain,
                            height: 50,
                            image: AssetImage(
                                'assets/vehicle_condition_images/speed.png'),
                          )),
                          Expanded(
                              child: Image(
                            fit: BoxFit.contain,
                            height: 50,
                            image: AssetImage(
                                'assets/vehicle_condition_images/gear.png'),
                          )),
                          Expanded(
                              child: Image(
                            fit: BoxFit.contain,
                            height: 50,
                            image: AssetImage(
                                'assets/vehicle_condition_images/lagage_size.png'),
                          ))
                        ],
                      ),
                    ),
                    const Text(
                      'Renter ',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/${vehicle.renterImage}'),
                              radius: 20,
                            ),
                            const SizedBox(
                              width: 7.0,
                            ),
                            Expanded(
                              child: Text(
                                vehicle.renterName,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 7.0,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color(0xFF9EB8D9),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  // TODO : Add book marks
                                },
                                icon:
                                    const Icon(Icons.bookmark_outline_rounded),
                              ),
                            ),
                            const SizedBox(
                              width: 7.0,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10.0),
                                color: const Color(0xFF9EB8D9),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  // TODO : Add book marks
                                },
                                icon: const Icon(Icons.messenger_outline_sharp),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            rates(vehicle.rateValue),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text('(Reviews ${vehicle.reviews})'),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                //Booking button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      //TODO : Add booking function
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF9ADE7B)),
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(220, 50)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Book Now',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 7.0,
                ),
                Text(
                  '\$${vehicle.rentPrice}/Day',
                  style: const TextStyle(
                      fontWeight: FontWeight.w900, fontSize: 26.0),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
