 // Adjust this import according to your project structure

import '../models/reminder_model.dart';

class ReminderService {
  Future<List<ReminderModel>> getSampleReminders() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    // Sample data
    List<Map<String, dynamic>> sampleData = [
      {
        'title': 'HOA Monthly Meeting',
        'description': 'Attend the HOA meeting to discuss community updates.',
        'date': '2024-08-25',
        'status': 'Pending',
      },
      {
        'title': 'Scheduled Maintenance',
        'description': 'Ensure all maintenance tasks are completed on time.',
        'date': '2024-09-01',
        'status': 'Completed',
      },
      {
        'title': 'HOA Dues Payment',
        'description': 'Make sure to pay the HOA dues by the due date.',
        'date': '2024-09-05',
        'status': 'Pending',
      },
      {
        'title': 'Property Inspection',
        'description': 'Inspect the property for any damages or required repairs.',
        'date': '2024-09-10',
        'status': 'Pending',
      },
      {
        'title': 'Community Event',
        'description': 'Join the community event for a day of fun and activities.',
        'date': '2024-09-15',
        'status': 'Pending',
      },
      {
        'title': 'Board Meeting',
        'description': 'Attend the board meeting to discuss financial reports.',
        'date': '2024-09-20',
        'status': 'Completed',
      },
    ];

    // Convert sample data to list of ReminderModel
    return sampleData.map((data) => ReminderModel.fromJson(data)).toList();
  }
}