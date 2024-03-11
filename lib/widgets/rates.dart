import 'package:flutter/material.dart';

Widget rates(double rate) {
  int i = 0;
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for (; i < rate.round(); i++)
        const Icon(
          Icons.star,
          color: Color.fromARGB(255, 245, 232, 120),
          size: 18.0,
        ),
      for (; i < 5; i++)
        const Icon(
          Icons.star,
          color: Colors.grey,
          size: 18.0,
        ),
      const SizedBox(width: 8.0),
      Text(rate.toStringAsFixed(1)),
    ],
  );
}
