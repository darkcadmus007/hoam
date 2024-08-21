import 'package:flutter/material.dart';
import 'package:hoam_v1/core/utils/utils.dart';
import 'package:hoam_v1/ui/pages/deliveries.dart';
import 'package:hoam_v1/ui/pages/security_home_page.dart';

import '../../core/utils/navigations.dart';
import '../pages/guests_page.dart';

class MenuGrid extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
      'icon': 'https://cdn-icons-png.flaticon.com/128/4009/4009133.png',
      'text': 'Security',
      'page': SecurityHomePage()
    },
    {
      'icon': 'https://cdn-icons-png.flaticon.com/128/8084/8084600.png',
      'text': 'Amenities',
      'page': DeliveriesPage()
    },
    {
      'icon': 'https://cdn-icons-png.flaticon.com/128/3284/3284606.png',
      'text': 'Guests',
      'page': GuestsPage()
    },
    {
      'icon': 'https://cdn-icons-png.flaticon.com/128/3063/3063822.png',
      'text': 'Deliveries',
      'page': DeliveriesPage()
    },
    {
      'icon': 'https://cdn-icons-png.flaticon.com/128/3631/3631153.png',
      'text': 'Services',
      'page': DeliveriesPage()
    },
    {
      'icon': 'https://cdn-icons-png.flaticon.com/128/4285/4285662.png',
      'text': 'Reminders',
      'page': DeliveriesPage()
    },
    {
      'icon': 'https://cdn-icons-png.flaticon.com/128/2534/2534888.png',
      'text': 'HOA Rules',
      'page': DeliveriesPage()
    },
    {
      'icon': 'https://cdn-icons-png.flaticon.com/128/5415/5415273.png',
      'text': 'Registry',
      'page': DeliveriesPage()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            startScreen(context, menuItems[index]['page']);
          },
          child: Card(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn.vectorstock.com/i/500p/28/93/gradient-background-in-pink-and-blue-tones-vector-51612893.jpg'), // Update with your background image
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: [
                  Center(
                    child: Image.network(
                      menuItems[index]['icon'],
                      width: 25, // Set the width as needed
                      height: 25, // Set the height as needed
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(menuItems[index]['text'],
                      style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
