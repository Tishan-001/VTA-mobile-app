import 'package:flutter/material.dart';
import 'package:vta_mobile/pages/tour_guider_details.dart';
import 'package:vta_mobile/widgets/rates.dart';
import 'package:vta_mobile/tour_guid.dart';

class TourGuiders extends StatefulWidget {
  const TourGuiders({super.key});

  @override
  State<TourGuiders> createState() => _TourGuidersState();
}

class _TourGuidersState extends State<TourGuiders> {
  List<TourGuide> tourGuideList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TourGuide tourGuide = TourGuide(
      image: 'TourGuider.png',
      experience: '4',
      name: 'Sri Devinda',
      id: 'xxxx',
      languagesSpoken: ['Sinhala', 'English', 'Spanish'],
      price: 50.0,
    );
    tourGuide.ratedValue = 3;
    for (int i = 0; i < 20; i++) {
      tourGuideList.add(tourGuide);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(25.0),
          child: Text(
            'Tour Guiders',
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
              //Search Bar
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
                    itemCount: tourGuideList.length,
                    itemBuilder: (context, index) {
                      TourGuide tourGuide = tourGuideList[index];
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TourGuiderDetails(
                                        tourGuide: tourGuide)))
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  image:
                                      AssetImage('assets/${tourGuide.image}'),
                                  width: 140,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(tourGuide.name),
                              rates(tourGuide.ratedValue),
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
