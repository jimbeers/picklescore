import 'package:flutter/material.dart';

class TwoDigitNumber extends StatelessWidget {
  final int number;

  TwoDigitNumber({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color c = number < 11 ? Color.fromARGB(255, 71, 4, 30) : Colors.blue;

    return Container(
      width: 170.0,
      height: 170.0,
      decoration: BoxDecoration(
        color: c,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          number.toString().padLeft(2, '0'),
          style: TextStyle(fontSize: 120, color: Colors.white),
        ),
      ),
    );
  }
}
