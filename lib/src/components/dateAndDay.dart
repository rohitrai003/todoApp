import 'package:flutter/material.dart';
import 'package:todo_list_app/src/Constant/value.dart';

dateAndDay() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${date.day}/${date.month}/${date.year}',
          style: const TextStyle(fontSize: 15),
        ),
        Text(
          week[date.weekday].toString().toUpperCase(),
          style: const TextStyle(fontSize: 15),
        ),
      ],
    ),
  );
}
