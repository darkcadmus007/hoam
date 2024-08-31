import 'package:flutter/material.dart';
import 'package:hoam_v1/core/Data/reminders_data.dart';
import 'package:hoam_v1/core/models/reminder_model.dart';

import '../../core/resources/colors.dart';
import '../../core/resources/styles.dart';
import '../../core/resources/themes.dart';
import '../components/MenuItems/Loader/card_loader_item_one.dart';
import '../components/MenuItems/Loader/card_loader_item_two.dart';
import '../components/appbar_widget.dart';
import '../components/paginate_list.dart';

class RemindersPage extends StatefulWidget {
  const RemindersPage({super.key});

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
  appBar: AppbarWidget(
        title: 'Reminders',
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                decoration: primaryInputDecoration(context,Icon(Icons.search, color: greyColor,)).copyWith(
                  hintText: 'Search for Reminder',
                  fillColor: theme(context).cardColor,
                ),
                // onSubmitted: (value) => GlobalNotifier.read(context).notify(),
              ),
            ),     

                   
            const SizedBox(height: 10),
            Expanded(
                child: ListViewPagination(
              listPadding: const EdgeInsets.symmetric(horizontal: 1),
              loader: (page) => ReminderService().getSampleReminders(),
              preloadBuilder: (context, index) =>
                  CardItemLoaderItemTwo(context),
              builder: _listItem,
            )),
          ],
        ),
      ),
    );
  }

   Widget _listItem(BuildContext context, int index, ReminderModel item) {

    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 5.0),
      child: _buildReminderCard(item),
    );
  }



  Widget _buildReminderCard(ReminderModel reminder) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              reminder.title!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(reminder.description!),
            SizedBox(height: 8.0),
            Text(
              'Date: ${reminder.date}',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}