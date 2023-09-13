import 'package:flutter/material.dart';

class SideScore extends StatelessWidget {
  final int number;
  final bool side1server;

  SideScore({Key? key, required this.number, required this.side1server})
      : super(key: key);

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
        child: Column(
          children: [
            Text(
              "server",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            if (side1server)
              SizedBox(
                height: 3,
              ),
            if (side1server)
              Icon(
                Icons.arrow_drop_up, // Icon type
                size: 50.0, // Size in pixels
                color: Colors.blue, // Color of the icon (optional)
              ),
            Text(
              number.toString().padLeft(2, '0'),
              style: TextStyle(fontSize: 80, color: Colors.white),
            ),
            if (!side1server)
              Icon(
                Icons.arrow_drop_down, // Icon type
                size: 50.0, // Size in pixels
                color: Colors.blue, // Color of the icon (optional)
              ),
          ],
        ),
      ),
    );
  }
}
