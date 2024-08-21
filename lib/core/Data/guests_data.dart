import '../models/guests_model.dart';

class GuestsService {
  Future<List<GuestsModel>> getSampleGuests() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));

    // Sample data
    List<Map<String, dynamic>> sampleData = [
      {
        'name': 'Caloy Yulo',
        'carPlateNo': 'LKJ 215',
        'color': 'White',
        'date': '2024-08-14T10:00:00Z',
        'status': 'Arrived',
      },
      {
        'name': 'Jane Doe',
        'carPlateNo': 'XYZ 123',
        'color': 'Black',
        'date': '2024-08-14T10:00:00Z',
        'status': 'Pending',
      },
      {
        'name': 'John Smith',
        'carPlateNo': 'ABC 456',
        'color': 'Red',
        'date': '2024-08-14T10:00:00Z',
        'status': 'Arrived',
      },
      {
        'name': 'Alice Brown',
        'carPlateNo': 'EFG 789',
        'color': 'Blue',
        'date': '2024-08-14T10:00:00Z',
        'status': 'Pending',
      },
      {
        'name': 'Michael Johnson',
        'carPlateNo': 'HIJ 012',
        'color': 'Silver',
        'date': '2024-08-14T10:00:00Z',
        'status': 'Arrived',
      },
    ];

    // Convert sample data to list of GuestsModel
    return sampleData.map((data) => GuestsModel.fromJson(data)).toList();
  }
}
