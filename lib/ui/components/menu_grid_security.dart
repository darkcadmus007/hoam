import 'package:flutter/material.dart';
import 'package:hoam_v1/core/utils/utils.dart';
import 'package:hoam_v1/ui/pages/cars_page.dart';
import 'package:hoam_v1/ui/pages/deliveries.dart';
import 'package:hoam_v1/ui/pages/helper_pass_page.dart';
import 'package:hoam_v1/ui/pages/tenants_page.dart';

import '../../core/resources/colors.dart';
import '../../core/utils/navigations.dart';
import '../pages/guests_page.dart';

class MenuGridSecurity extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {'icon': 'security-icon.png', 'text': 'Cars', 'page': CarsPage()},
    {
      'icon': 'security-icon.png',
      'text': 'Helpers Pass',
      'page': HelperPassPage()
    },
    {
      'icon': 'deliveries-icon.png',
      'text': 'Deliveries',
      'page': DeliveriesPage()
    },
    {
      'icon': 'guests-icon.png',
      'text': 'Expected Guests',
      'page': GuestsPage()
    },
    {'icon': 'security-icon.png', 'text': 'Tenants', 'page': TenantsPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.4,
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
                color: menuGridColor,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/icons/${menuItems[index]['icon']}',
                      width: 25, // Set the width as needed
                      height: 25, // Set the height as needed
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(menuItems[index]['text'],
                      style: TextStyle(fontSize: 16, color: lightBackground)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
