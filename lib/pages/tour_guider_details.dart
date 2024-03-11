import 'package:flutter/material.dart';
import 'package:vta_mobile/tour_guid.dart';

class TourGuiderDetails extends StatefulWidget {
  final TourGuide tourGuide;
  const TourGuiderDetails({super.key, required this.tourGuide});

  @override
  State<TourGuiderDetails> createState() => _TourGuiderDetailsState();
}

class _TourGuiderDetailsState extends State<TourGuiderDetails> {
  late TourGuide tourGuide;
  void initState() {
    super.initState();
    tourGuide = widget.tourGuide;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.0,
        title: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Text(
            tourGuide.name,
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
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/${tourGuide.image}'),
                  radius: 150.0,
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    details('Name', tourGuide.name),
                    details('NIC', tourGuide.id),
                    details('Price', '${tourGuide.price.toString()} /day'),
                    details('Experience', tourGuide.experience),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Languages',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(':'),
                        Column(
                          children: [
                            for (var language in tourGuide.languagesSpoken)
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  language,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Booking button
                    ElevatedButton(
                      onPressed: () {
                        //TODO : Add booking function
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF9ADE7B)),
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(228, 40)),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Book Now',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
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
                        icon: const Icon(Icons.bookmark_outline_rounded),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Tour guider details template
Widget details(String property, String value) {
  return Row(
    children: [
      Text(
        property,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
      const SizedBox(
        width: 10.0,
      ),
      const Text(':'),
      Text(
        value,
        style: const TextStyle(
          fontSize: 18.0,
        ),
      ),
    ],
  );
}
