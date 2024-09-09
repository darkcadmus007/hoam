import 'package:flutter/material.dart';
import 'package:hoam_v1/core/utils/utils.dart';
import 'package:hoam_v1/ui/pages/cars_page.dart';
import 'package:hoam_v1/ui/pages/deliveries.dart';
import 'package:hoam_v1/ui/pages/helper_pass_page.dart';
import 'package:hoam_v1/ui/pages/tenants_page.dart';
import 'package:hoam_v1/ui/screens/tenant_home_screen.dart';
import 'package:provider/provider.dart';

import '../../core/providers/bottom_navigation_provider.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int currentIndex = 0;
  final List<Widget> _screens = [
    TenantHomeScreen(),
    CarsPage(),
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
                        CarsPage(),
                        DeliveriesPage(),
                        HelperPassPage(),
                        TenantsPage(),
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
      Icon(
        Icons.home,
        color: Color.fromRGBO(91, 55, 183, 1),
      ),
      Text(
        'Home',
        style: TextStyle(
            color: Color.fromRGBO(91, 55, 183, 1), fontWeight: FontWeight.bold),
      ),
      Color.fromRGBO(223, 215, 243, 1),
    ),
    NavigationItem(
        Icon(Icons.list, color: Color.fromRGBO(201, 55, 157, 1)),
        Text(
          'Reminders',
          style: TextStyle(
              color: Color.fromRGBO(201, 55, 157, 1),
              fontWeight: FontWeight.bold),
        ),
        Color.fromRGBO(244, 211, 235, 1)),
    NavigationItem(
        Icon(
          Icons.warning,
          color: Color.fromRGBO(230, 169, 25, 1),
        ),
        Text(
          'Violations',
          style: TextStyle(
              color: Color.fromRGBO(230, 169, 25, 1),
              fontWeight: FontWeight.bold),
        ),
        Color.fromRGBO(251, 239, 211, 1)),
    NavigationItem(
        Icon(Icons.chat, color: Color.fromRGBO(17, 148, 170, 1)),
        Text(
          'Message',
          style: TextStyle(
              color: Color.fromRGBO(17, 148, 170, 1),
              fontWeight: FontWeight.bold),
        ),
        Color.fromRGBO(211, 235, 239, 1)),
    NavigationItem(
        Icon(Icons.person_outline, color: Color.fromRGBO(17, 148, 170, 1)),
        Text(
          'Profile',
          style: TextStyle(
              color: Color.fromRGBO(17, 148, 170, 1),
              fontWeight: FontWeight.bold),
        ),
        Color.fromRGBO(211, 235, 239, 1))
  ];

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      height: 50,
      width: isSelected ? 120 : 50,
      padding: isSelected ? EdgeInsets.only(left: 16, right: 16) : null,
      decoration: isSelected
          ? BoxDecoration(
              color: item.color,
              borderRadius: BorderRadius.all(Radius.circular(50)))
          : null,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconTheme(
                data: IconThemeData(
                  size: 24,
                  color: isSelected ? backgroundColorNav : Colors.black,
                ),
                child: item.icon,
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
      height: 56,
      padding: EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
      decoration: BoxDecoration(
          color: Colors.white,
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
  final Icon icon;
  final Text title;
  final Color color;

  NavigationItem(
    this.icon,
    this.title,
    this.color,
  );
}
