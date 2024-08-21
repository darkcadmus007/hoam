import '../models/delivery_model.dart';

class DeliveryService {
  Future<List<DeliveryModel>> getSampleDeliveries() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));

    // Sample data
    List<Map<String, dynamic>> sampleData = [
      {
        'id': '1',
        'title': 'Grab Food',
        'date': '2024-08-14T10:00:00Z',
        'type': 'Small Parcel',
      },
      {
        'id': '2',
        'title': 'Shopee',
        'date': '2024-08-14T10:00:00Z',
        'type': 'Small Parcel',
      },
      {
        'id': '3',
        'title': 'Lazada',
        'date': '2024-08-14T10:00:00Z',
        'type': 'Small Parcel',
      },
      {
        'id': '4',
        'title': 'Lazada',
        'date': '2024-08-14T10:00:00Z',
        'type': 'Small Parcel',
      },
      {
        'id': '5',
        'title': 'Lazada',
        'date': '2024-08-14T10:00:00Z',
        'type': 'Small Parcel',
      },
    ];

    // Convert sample data to list of DeliveryModel
    return sampleData.map((data) => DeliveryModel.fromJson(data)).toList();
  }
}
