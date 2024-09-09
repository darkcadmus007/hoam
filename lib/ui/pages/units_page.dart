import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hoam_v1/core/Data/unit_data.dart';
import 'package:hoam_v1/core/models/units_model.dart';

import '../../core/resources/colors.dart';
import '../../core/resources/styles.dart';
import '../../core/resources/themes.dart';
import '../components/MenuItems/Loader/card_loader_item_two.dart';
import '../components/MenuItems/card_item_one.dart';
import '../components/MenuItems/card_item_three.dart';
import '../components/appbar_widget.dart';
import '../components/custom_divider.dart';
import '../components/custom_shimmer.dart';
import '../components/header_two.dart';
import '../components/paginate_list.dart';

class UnitsPage extends StatefulWidget {
  const UnitsPage({super.key});

  @override
  State<UnitsPage> createState() => _UnitsPageState();
}

class _UnitsPageState extends State<UnitsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: 'Units',
      ),
      body: SafeArea(
        child: Column(
          children: [
            HeaderTwo(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                decoration: primaryInputDecoration(
                    context,
                    Icon(
                      Icons.search,
                      color: greyColor,
                    )).copyWith(
                  hintText: 'Search Name',
                  fillColor: theme(context).cardColor,
                ),
                // onSubmitted: (value) => GlobalNotifier.read(context).notify(),
              ),
            ),
            Gap(15),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       children: [
            //         ScrollableButton(text: 'Button 1'),
            //         ScrollableButton(text: 'Button 2'),
            //         ScrollableButton(text: 'Button 3'),
            //         ScrollableButton(text: 'Button 4'),
            //         ScrollableButton(text: 'Button 5'),
            //         ScrollableButton(text: 'Button 6'),
            //         ScrollableButton(text: 'Button 7'),
            //         ScrollableButton(text: 'Button 8'),
            //       ],
            //     ),
            //   ),
            // ),
            Expanded(
                child: ListViewPagination(
              listPadding: const EdgeInsets.symmetric(horizontal: 1),
              loader: (page) => UnitService().getSampleUnits(),
              preloadBuilder: (context, index) =>
                  CardItemLoaderItemTwo(context),
              builder: _listItem,
            )),
          ],
        ),
      ),
    );
  }

  Widget _listItem(BuildContext context, int index, UnitModel item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: CardItemThree(
        imageUrl: item.houseImg!,
        address: item.address!,
        details: item.description!,
      ),
    );
  }

  // Widget _listItem(BuildContext context, int index, TenantModel item) {
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
  //                 'House ${index + 1}',
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
  //               _buildLabelValue('Address:', item.address, Colors.blue),
  //             ],
  //           ),
  //           SizedBox(height: 4.0),
  //           Row(
  //             children: [
  //               _buildLabelValue('Name:', item.name, Colors.blue),
  //             ],
  //           ),
  //            SizedBox(height: 4.0),
  //           Row(
  //             children: [
  //               _buildLabelValue('Mobile:', item.mobile, Colors.blue),
  //             ],
  //           ),
  //           SizedBox(height: 4.0),
  //           Row(
  //             children: [
  //               _buildLabelValue('Email:', item.email, Colors.blue),
  //             ],
  //           ),
  //             SizedBox(height: 4.0),
  //           Row(
  //             children: [
  //               _buildLabelValue('Car:', item.car, Colors.blue),
  //             ],
  //           ),
  //         SizedBox(height: 4.0),
  //           _buildStatus(item.status),
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
              color: status == 'Active' ? Colors.green : Colors.red,
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

class ScrollableButton extends StatelessWidget {
  final String text;

  ScrollableButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: () {
          // Define your button action here
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
