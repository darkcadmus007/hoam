import 'package:flutter/material.dart';
import 'package:hoam_v1/core/resources/colors.dart';
import 'package:hoam_v1/ui/pages/cars_page.dart';
import 'package:hoam_v1/ui/pages/deliveries.dart';
import 'package:hoam_v1/ui/pages/guests_page.dart';
import 'package:hoam_v1/ui/pages/helper_pass_page.dart';
import 'package:hoam_v1/ui/pages/home.dart';
import 'package:hoam_v1/ui/pages/security_home_page.dart';
import 'package:hoam_v1/ui/pages/tenants_page.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Marlon Lim';
    final email = 'marlonlim@gmail.com';
    final urlImage =
        'https://scontent.fmnl8-6.fna.fbcdn.net/v/t39.30808-6/454676137_3121796117961384_7656079968786077769_n.png?_nc_cat=104&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=46unVwGAgTMQ7kNvgEjdI20&_nc_ht=scontent.fmnl8-6.fna&oh=00_AYBIXx2xBYwoNWecCunXYyBtrTMBthmefK68GhcqBtN6bQ&oe=66C87FC2';

    return Drawer(
      child: Material(
        color: secondaryColor,
        child: ListView(
          children: <Widget>[
            buildHeader(
                urlImage: urlImage, name: name, email: email, onClicked: () {}
                // onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => UserPage(
                //     name: 'Sarah Abs',
                //     urlImage: urlImage,
                //   ),
                // )),
                ),
                     Divider(color: Colors.white70),
            Container(
              padding: padding,
              child: Column(
                children: [
              
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: 'Home',
                    icon: Icons.home,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  buildExpandedMenuItem(
                      text: 'Security',
                      icon: Icons.security,
                      tileItems: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: buildMenuItem(
                            text: 'Cars',
                            icon: Icons.car_rental,
                            onClicked: () => selectedItem(context, 1),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: buildMenuItem(
                            text: 'Helper Pass',
                            icon: Icons.help_center,
                            onClicked: () => selectedItem(context, 2),
                          ),
                        ),
                        Padding(
                           padding: const EdgeInsets.only(left: 10),
                          child: buildMenuItem(
                            text: 'Deliveries',
                            icon: Icons.delivery_dining,
                            onClicked: () => selectedItem(context, 3),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: buildMenuItem(
                            text: 'Expected Guests',
                            icon: Icons.person_3_outlined,
                            onClicked: () => selectedItem(context, 4),
                          ),
                        ),
                        Padding(
                           padding: const EdgeInsets.only(left: 10),
                          child: buildMenuItem(
                            text: 'Tenants',
                            icon: Icons.person_4_sharp,
                            onClicked: () => selectedItem(context, 5),
                          ),
                        ),
                      ]),
                  buildMenuItem(
                    text: 'Amenities',
                    icon: Icons.assessment,
                    onClicked: () => selectedItem(context, 6),
                  ),
                  buildMenuItem(
                    text: 'HOA Rules',
                    icon: Icons.rule,
                    onClicked: () => selectedItem(context, 7),
                  ),
                  buildMenuItem(
                    text: 'Reminders',
                    icon: Icons.room_service,
                    onClicked: () => selectedItem(context, 8),
                  ),

                  Divider(color: Colors.white70),
                  // buildMenuItem(
                  //   text: 'Terms and Conditions',
                  //   icon: Icons.account_tree_outlined,
                  //   onClicked: () => selectedItem(context, 4),
                  // ),
                  buildMenuItem(
                    text: 'Logout',
                    icon: Icons.logout,
                    onClicked: () => selectedItem(context, 9),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 20)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      );

 

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Widget buildExpandedMenuItem({
    required String text,
    required IconData icon,
    required List<Widget> tileItems,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ExpansionTile(      
        leading: Icon(icon, color: color),
        title: Text(text, style: TextStyle(color: color)),
        children: tileItems);
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => CarsPage(),
        ));
          case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HelperPassPage(),
        ));
          case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DeliveriesPage(),
        ));
         case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => GuestsPage(),
        ));
         case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TenantsPage(),
        ));
        break;
    }
  }
}
