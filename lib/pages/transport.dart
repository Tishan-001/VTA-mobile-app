import 'package:flutter/material.dart';
import 'package:vta_mobile/pages/transport_list.dart';
import 'package:vta_mobile/tour_guid.dart';

class Transports extends StatefulWidget {
  const Transports({super.key});

  @override
  State<Transports> createState() => _TransportsState();
}

class _TransportsState extends State<Transports> {
  List<TourGuide> tourGuideList = [];
  List<Map<String, String>> transportMethods = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Transport method list
    transportMethods = [
      {'Motor Bike': 'motorBike.png'},
      {'Tuk Tuk': 'tuktuk.png'},
      {'Car': 'car.png'},
      {'Van': 'van.png'},
      {'Jeep': 'tuktuk.png'},
      {'Bus': 'bus.png'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(25.0),
          child: Text(
            'Transport',
            style: TextStyle(
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
          padding: const EdgeInsets.all(25.0),
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
                          hintText: 'Search',
                          border: InputBorder.none,
                          //TODO: Impliment search functionality here
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 160 / 207,
                    ),
                    itemCount: transportMethods.length,
                    itemBuilder: (context, index) {
                      // Get the key and value from the map
                      String transportName = transportMethods[index].keys.first;
                      String imageName =
                          transportMethods[index][transportName]!;
                      return Container(
                        width: 160,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: const Color(0xffB2BECD),
                            ),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: GestureDetector(
                          onTap: () => {
                            //TODO: implemet function to navigate to the details
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TransportList(
                                        transportName: transportName)))
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  image: AssetImage(
                                      'assets/transportmethods/$imageName'),
                                  width: 114,
                                  height: 108,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Text(transportName),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
