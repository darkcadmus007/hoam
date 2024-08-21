import '../models/helper_pass_model.dart';

class HelperPassService {
  Future<List<HelperPassModel>> getSampleHelperPasses() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));

    // Sample data
    List<Map<String, dynamic>> sampleData = [
      {
        'name': 'Anna Lee',
        'gender': 'Female',
        'photo_img': 'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
        'special_instruction': 'Vegetarian',
        'has_bag': true,
        'status': 'Cleared',
      },
      {
        'name': 'Ben Johnson',
        'gender': 'Male',
        'photo_img': 'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
        'special_instruction': 'No peanuts',
        'has_bag': false,
        'status': 'Pending',
      },
      {
        'name': 'Cathy Brown',
        'gender': 'Female',
        'photo_img': 'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?cs=srgb&dl=pexels-olly-774909.jpg&fm=jpg',
        'special_instruction': 'Gluten-free',
        'has_bag': true,
        'status': 'Cleared',
      },
      {
        'name': 'David Smith',
        'gender': 'Male',
        'photo_img': 'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
        'special_instruction': 'N/A',
        'has_bag': false,
        'status': 'Pending',
      },
      {
        'name': 'Eva Green',
        'gender': 'Female',
        'photo_img': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyEaZqT3fHeNrPGcnjLLX1v_W4mvBlgpwxnA&s',
        'special_instruction': 'Requires wheelchair access',
        'has_bag': true,
        'status': 'Cleared',
      },
    ];

    // Convert sample data to list of HelperPassModel
    return sampleData.map((data) => HelperPassModel.fromJson(data)).toList();
  }
}
