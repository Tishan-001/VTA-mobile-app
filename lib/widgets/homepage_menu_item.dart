import 'package:flutter/material.dart';
import 'package:vta_mobile/pages/tour_guiders.dart';
import 'package:vta_mobile/pages/transport.dart';
import 'package:vta_mobile/pages/travel_plans.dart';

Widget HomePageMenueItem(BuildContext context, String service, String image) {
  return Container(
    height: 80,
    width: 70,
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 219, 230, 244),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: const Color(0xffB2BECD),
        )),
    child: ClipRRect(
      child: GestureDetector(
        onTap: () => {serviceNavigation(context, service)},
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/home_page_menue_items/$image'),
              height: 40,
              fit: BoxFit.contain,
            ),
            Text(
              service,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void serviceNavigation(BuildContext context, String service) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => navigationPage(service),
      ));
}

Widget navigationPage(String service) {
  if (service == 'Travel Plan') {
    return TravelPlans();
  } else if (service == 'Tour Guiders') {
    return TourGuiders();
  } else {
    return Transports();
  }
}
