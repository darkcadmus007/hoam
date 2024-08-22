import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hoam_v1/core/Data/delivery_data.dart';
import 'package:hoam_v1/core/Data/guests_data.dart';
import 'package:hoam_v1/core/Data/helper_pass_data.dart';
import 'package:hoam_v1/core/https/delivery_http.dart';
import 'package:hoam_v1/core/models/car_model.dart';
import 'package:hoam_v1/core/models/delivery_model.dart';
import 'package:hoam_v1/core/models/guests_model.dart';
import 'package:hoam_v1/core/utils/utils.dart';
import 'package:hoam_v1/ui/components/MenuItems/Loader/card_loader_item_two.dart';

import '../../core/Data/car_data.dart';
import '../../core/models/helper_pass_model.dart';
import '../../core/resources/styles.dart';
import '../../core/resources/themes.dart';
import '../components/MenuItems/card_item_two.dart';
import '../components/Widgets/lavel_value_widget.dart';
import '../components/custom_divider.dart';
import '../components/custom_shimmer.dart';
import '../components/drawer.dart';
import '../components/header.dart';
import '../components/paginate_list.dart';

class DeliveriesPage extends StatelessWidget {
  const DeliveriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deliveries'),
      ),
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
              loader: (page) => DeliveryService().getSampleDeliveries(),
              preloadBuilder: (context, index) =>
                  CardItemLoaderItemTwo(context),
              builder: _listItem,
            )),
          ],
        ),
      ),
    );
  }

  // Widget _listItem(BuildContext context, int index, DeliveryModel item) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 5.0),
  //     child: ItemCardTwo(
  //         key1: 'From',
  //         val1: item.title,
  //         key2: 'Name',
  //         val2: 'Joana Doe',
  //         key3: 'Type',
  //         val3: item.type,
  //         key4: 'Date & Time',
  //         val4: convertDate(item.date)),
  //   );
  // }

  Widget _listItem(BuildContext context, int index, DeliveryModel item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 16.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelValueWidget(
              label: 'From: ',
              value: item.title,
            ),
            const Gap(5),
            LabelValueWidget(
              label: 'Name: ',
              value: 'Joana Doe',
            ),
              const Gap(5),
            LabelValueWidget(
              label: 'Type: ',
              value: item.type,
            ),
              const Gap(5),
            LabelValueWidget(
              label: 'Date and Time: ',
              value: convertDate(item.date),
            ),
          ],
        ),
      ),
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
