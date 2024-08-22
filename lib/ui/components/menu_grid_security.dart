import 'package:flutter/material.dart';
import 'package:hoam_v1/core/utils/utils.dart';
import 'package:hoam_v1/ui/pages/cars_page.dart';
import 'package:hoam_v1/ui/pages/deliveries.dart';
import 'package:hoam_v1/ui/pages/helper_pass_page.dart';
import 'package:hoam_v1/ui/pages/tenants_page.dart';

import '../../core/utils/navigations.dart';
import '../pages/guests_page.dart';

class MenuGridSecurity extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
      'icon': 'https://cdn-icons-png.flaticon.com/128/741/741407.png',
      'text': 'Cars',
      'page': CarsPage()
    },
    {
      'icon': 'https://cdn-icons-png.flaticon.com/128/3270/3270981.png',
      'text': 'Helpers Pass',
      'page': HelperPassPage()
    },
    {
      'icon': 'https://cdn-icons-png.flaticon.com/128/3063/3063822.png',
      'text': 'Deliveries',
      'page': DeliveriesPage()
    },
    {
      'icon': 'https://cdn-icons-png.flaticon.com/128/16490/16490167.png',
      'text': 'Expected Guests',
      'page': GuestsPage()
    },
    {
      'icon': 'https://cdn-icons-png.flaticon.com/128/11608/11608210.png',
      'text': 'Tenants',
      'page': TenantsPage()
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
            elevation: 5.0,
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
