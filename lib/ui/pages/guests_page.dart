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
import '../components/MenuItems/Loader/card_loader_item_two.dart';
import '../components/MenuItems/card_item_two.dart';
import '../components/custom_divider.dart';
import '../components/custom_shimmer.dart';
import '../components/drawer.dart';
import '../components/header.dart';
import '../components/paginate_list.dart';

class GuestsPage extends StatelessWidget {
  const GuestsPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text('Expected Guests'),
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
            SizedBox(height: 15),
            Expanded(
                child: ListViewPagination(
              listPadding: const EdgeInsets.symmetric(horizontal: 1),
              loader: (page) => GuestsService().getSampleGuests(),
              preloadBuilder: (context, index) => CardItemLoaderItemTwo(context),
              builder: _listItem,
            )),
          ],
        ),
      ),
    );
  }

  Widget _listItem(BuildContext context, int index, GuestsModel item) {

    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 5.0),
      child: ItemCardTwo(key1: 'Name',val1: item.name,key2: 'Car Plate Number',val2:item.carPlateNo , key3: 'Date & Time', val3: convertDate(item.date), key4: 'Status' , val4: item.status),
    );
  }


  // Widget _listItem(BuildContext context, int index, GuestsModel item) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
  //     child: Container(
  //       padding: EdgeInsets.all(16.0),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(12.0),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.grey.withOpacity(0.3),
  //             spreadRadius: 2,
  //             blurRadius: 5,
  //             offset: Offset(0, 3),
  //           ),
  //         ],
  //       ),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Row(
  //             children: [
  //               Text(
  //                 'Guest ${index + 1}',
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 16.0,
  //                   color: Colors.orange,
  //                 ),
  //               ),
  //               Spacer(),
  //               Text(
  //                 'ID: [ 1 ]',
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 14.0,
  //                   color: Colors.orange,
  //                 ),
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: 8.0),
  //           Row(
  //             children: [
  //               _buildLabelValue('Name:', item.name, Colors.blue),
  //             ],
  //           ),
  //           SizedBox(height: 4.0),
  //           Row(
  //             children: [
  //               _buildLabelValue('Car Plate No.:', item.carPlateNo, Colors.blue),
  //             ],
  //           ),
  //           SizedBox(height: 4.0),
  //           Row(
  //             children: [
  //               _buildLabelValue('Color:', item.color, Colors.blue),
  //             ],
  //           ),
  //           SizedBox(height: 4.0),
  //           Row(
  //             children: [
  //               _buildLabelValue(
  //                   'Date and Time:', convertDate(item.date), Colors.blue),
  //             ],
  //           ),
  //            SizedBox(height: 8.0),
  //              _buildStatus(item.status),
  //         ],
  //       ),
  //     ),
  //   );
  // }

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
              color: status == 'Arrived' ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listItemShimmer(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black26),
          color: theme(context).canvasColor),
      child: ShimmerContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ShimmerObject(
                    width: 20, height: 20, radius: BorderRadius.circular(20)),
                const RowDivider(),
                const ShimmerObject(width: 80, height: 20),
                const Spacer(),
                const ShimmerObject(width: 60, height: 20),
              ],
            ),
            const ColumnDivider(space: 15),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerObject(width: 50, height: 10),
                      ColumnDivider(space: 5),
                      Row(
                        children: [
                          Expanded(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child:
                                      ShimmerObject(width: 100, height: 20))),
                          ShimmerObject(width: 40, height: 20),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
