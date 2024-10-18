import 'package:flutter/material.dart';
import 'package:hoam_v1/core/utils/utils.dart';
import 'package:hoam_v1/ui/pages/cars_page.dart';
import 'package:hoam_v1/ui/pages/deliveries.dart';
import 'package:hoam_v1/ui/pages/helper_pass_page.dart';
import 'package:hoam_v1/ui/pages/reminders_page.dart';
import 'package:hoam_v1/ui/pages/settings_page.dart';
import 'package:hoam_v1/ui/pages/tenants_page.dart';
import 'package:hoam_v1/ui/screens/inbox_screen.dart';
import 'package:hoam_v1/ui/screens/tenant_home_screen.dart';
import 'package:provider/provider.dart';

import '../../core/providers/bottom_navigation_provider.dart';
import '../../core/resources/colors.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int currentIndex = 0;
  final List<Widget> _screens = [
    TenantHomeScreen(),
    RemindersPage(),
    DeliveriesPage(),
    HelperPassPage(),
    TenantsPage(),
  ];

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     bottomNavigationBar: SizedBox(
  //       height: 90,
  //       child: BottomNavCustom(),
  //     ),
  //     body: _screens[currentIndex],
  //   );
  // }.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) =>
                  BottomNavigationProvider()..pageIndex = currentIndex),
        ],
        builder: (context, child) => PopScope(
                child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Column(
                children: [
                  Expanded(
                    child: IndexedStack(
                      index: BottomNavigationProvider.watch(context).pageIndex,
                      children: const [
                        TenantHomeScreen(),
                        InboxScreen(),                       
                        HelperPassPage(),
                        ProfileScreen(),
                      ],
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: SizedBox(
                height: 90,
                child: BottomNavCustom(),
              ),
            )));
  }
}

class BottomNavCustom extends StatefulWidget {
  @override
  _BottomNavCustomState createState() => _BottomNavCustomState();
}

class _BottomNavCustomState extends State<BottomNavCustom> {
  int selectedIndex = 0;
  Color backgroundColorNav = Colors.white;

  List<NavigationItem> items = [
    NavigationItem(
      'home.png',
      Text(
        'Home',
        style: TextStyle(color: standardWhite, fontWeight: FontWeight.bold),
      ),
      themeColor1,
    ),
     NavigationItem(
        'chat.png',
        Text(
          'Messages',
          style: TextStyle(color: standardWhite, fontWeight: FontWeight.bold),
        ),
        themeColor4),
    NavigationItem(
        'notification.png',
        Text(
          'Notifications',
          style: TextStyle(color: standardWhite, fontWeight: FontWeight.bold),
        ),
        themeColor2),      
    NavigationItem(
        'other.png',
        Text(
          'More',
          style: TextStyle(color: standardWhite, fontWeight: FontWeight.bold),
        ),
        themeColor5)
  ];

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      height: 45,
      width: isSelected ? 120 : 50,
      padding: isSelected ? EdgeInsets.only(left: 16, right: 16) : null,
      decoration: isSelected
          ? BoxDecoration(
              color: themeColor1,
              borderRadius: BorderRadius.all(Radius.circular(50)))
          : null,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/icons/${item.icon}', // Path to your PNG icon
                  width: 24, // Set the width of the icon
                  height: 24, // Set the height of the icon
                  fit: BoxFit.contain, // Adjust how the image fits the box
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: isSelected
                    ? DefaultTextStyle.merge(
                        style: TextStyle(color: backgroundColorNav),
                        child: item.title)
                    : Container(),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = BottomNavigationProvider.watch(context);
    return Container(
      height: 30,
      padding: EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          color: appbarColor,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.map((item) {
          var itemIndex = items.indexOf(item);
          return GestureDetector(
            onTap: () {
              setState(() {
                provider.pageIndex = itemIndex;
                selectedIndex = itemIndex;
              });
            },
            child: _buildItem(item, selectedIndex == itemIndex),
          );
        }).toList(),
      ),
    );
  }
}

class NavigationItem {
  final String icon;
  final Text title;
  final Color color;

  NavigationItem(
    this.icon,
    this.title,
    this.color,
  );
}
