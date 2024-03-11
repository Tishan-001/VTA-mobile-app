import 'package:flutter/material.dart';
import 'package:vta_mobile/travel_plan.dart';
import 'package:vta_mobile/widgets/tour_plan_template.dart';

class TravelPlans extends StatefulWidget {
  const TravelPlans({super.key});

  @override
  State<TravelPlans> createState() => _TravelPlanState();
}

class _TravelPlanState extends State<TravelPlans> {
  late List<TravelPlan> tourPlanList;
  TravelPlan travelPlan = TravelPlan(
    title: 'Tailored Travel for Foreigners',
    description:
        'A perfect blend of city life, cultural ness, hill country serenity, and beach bliss for an unforgettable journey.',
    images: const [
      'PlanDetails1.png',
      'PlanDetails2.png',
      'PlanDetails3.png',
      'PlanDetails4.png',
      'PlanDetails5.png'
    ],
    places: 'place1, Place2, Place3',
    accommodation: 'Accommodation',
    transportation: 'Transportation',
  );
  @override
  void initState() {
    super.initState();
    travelPlan.rate = 4.7;
    travelPlan.reviews = 110;
    tourPlanList = [
      travelPlan,
      travelPlan,
      travelPlan,
      travelPlan,
      travelPlan,
      travelPlan,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(25.0),
          child: Text(
            'Travel Plan',
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
                child: ListView.builder(
                    itemCount: tourPlanList.length,
                    itemBuilder: (context, index) {
                      return tourPlanTeplate(context, travelPlan);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
