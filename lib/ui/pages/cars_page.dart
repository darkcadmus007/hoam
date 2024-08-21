import 'package:flutter/material.dart';
import 'package:hoam_v1/core/Data/delivery_data.dart';
import 'package:hoam_v1/core/Data/guests_data.dart';
import 'package:hoam_v1/core/Data/helper_pass_data.dart';
import 'package:hoam_v1/core/https/delivery_http.dart';
import 'package:hoam_v1/core/models/car_model.dart';
import 'package:hoam_v1/core/models/delivery_model.dart';
import 'package:hoam_v1/core/models/guests_model.dart';
import 'package:hoam_v1/core/utils/utils.dart';

import '../../core/Data/car_data.dart';
import '../../core/models/helper_pass_model.dart';
import '../../core/resources/styles.dart';
import '../../core/resources/themes.dart';
import '../components/MenuItems/Loader/card_loader_item_one.dart';
import '../components/MenuItems/card_item_one.dart';
import '../components/custom_divider.dart';
import '../components/custom_shimmer.dart';
import '../components/drawer.dart';
import '../components/header.dart';
import '../components/paginate_list.dart';

class CarsPage extends StatelessWidget {
  const CarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Cars'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu), // Drawer icon
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Opens the drawer
              },
            );
          },
        ),
      ),
      drawer: NavigationDrawerWidget(),
      body: SafeArea(
        child: Column(
          children: [
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                decoration: primaryInputDecoration(context).copyWith(
                  hintText: 'Search Name',
                  fillColor: theme(context).cardColor,
                ),
                // onSubmitted: (value) => GlobalNotifier.read(context).notify(),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
                child: ListViewPagination(
              listPadding: const EdgeInsets.symmetric(horizontal: 1),
              loader: (page) => CarService().getSampleCars(),
              preloadBuilder: (context, index) => CardItemLoaderItemOne(context),
              builder: _listItem,
            )),
          ],
        ),
      ),
    );
  }

  Widget _listItem(BuildContext context, int index, CarModel item) {

    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 5.0),
      child: ItemCardOne(imageUrl: item.photo, headerTxt: item.status, title: item.model, subtitle: item.plateNumber),
    );
  }

  Widget _buildLabelValue(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: RichText(
        text: TextSpan(
          text: '$label ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
            color: Colors.grey[800],
          ),
          children: [
            TextSpan(
              text: value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderOption(String gender) {
    return Row(
      children: [
        _buildGenderCircle(gender == 'Female' ? Colors.pink : Colors.grey),
        Text('Female',
            style: TextStyle(
                color: gender == 'Female' ? Colors.black : Colors.grey)),
        SizedBox(width: 16.0),
        _buildGenderCircle(gender == 'Male' ? Colors.blue : Colors.grey),
        Text('Male',
            style: TextStyle(
                color: gender == 'Male' ? Colors.black : Colors.grey)),
      ],
    );
  }

  Widget _buildGenderCircle(Color color) {
    return Container(
      margin: EdgeInsets.only(right: 4.0),
      width: 12.0,
      height: 12.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }

  Widget _buildPhoto(String photoUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        photoUrl,
        height: 100.0,
        width: 100.0,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildLeaveWithBagOption(bool canLeaveWithBag) {
    return Row(
      children: [
        Text(
          'Can leave with bag?',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800]),
        ),
        SizedBox(width: 8.0),
        Icon(
          canLeaveWithBag ? Icons.check_circle : Icons.cancel,
          color: canLeaveWithBag ? Colors.green : Colors.red,
          size: 16.0,
        ),
        SizedBox(width: 4.0),
        Text(
          canLeaveWithBag ? 'yes' : 'no',
          style: TextStyle(
            color: canLeaveWithBag ? Colors.green : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildStatus(String status) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        children: [
          Text(
            'Status:',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800]),
          ),
          SizedBox(width: 8.0),
          Text(
            status,
            style: TextStyle(
              color: status == 'Active' ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

 
}
