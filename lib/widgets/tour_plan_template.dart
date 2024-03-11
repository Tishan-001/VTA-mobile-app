import 'package:flutter/material.dart';
import 'package:vta_mobile/pages/travel_plan_details.dart';
import 'package:vta_mobile/travel_plan.dart';
import 'package:vta_mobile/widgets/rates.dart';

Widget tourPlanTeplate(context, TravelPlan travelPlan) {
  return GestureDetector(
    onTap: () => {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TravelPlanDetails(travelPlan: travelPlan)))
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
            Image(
              image: AssetImage('assets/${travelPlan.images[0]}'),
              height: 120,
              width: 150,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    travelPlan.title,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    travelPlan.description,
                    style: const TextStyle(fontSize: 10),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  rates(travelPlan.rate),
                  const SizedBox(width: 8.0),
                  Text('(Reviews ${travelPlan.reviews})')
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
