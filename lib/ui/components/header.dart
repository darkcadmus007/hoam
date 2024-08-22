import 'package:flutter/material.dart';
import 'package:hoam_v1/core/resources/colors.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.1,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://www.shutterstock.com/image-photo/background-blue-canvas-260nw-400937191.jpg'), // Update with your background image
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
          Radius.circular(15)
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Stanford Executive Subdivision',
              style: TextStyle(
                fontSize: 25,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Home Owners Association App',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 252, 236, 236),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
