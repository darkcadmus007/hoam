import '../models/tenant_model.dart';

class TenantService {
  Future<List<TenantModel>> getSampleTenants() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    // Sample data
    List<Map<String, dynamic>> sampleData = [
      {
        'address': '123 Main St, Springfield',
        'name': 'John Doe',
        'mobile': '+1234567890',
        'email': 'johndoe@example.com',
        'car': 'Toyota Camry',
        'status': 'Active',
         'photo_image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIV99IJOGUBMQBy9kccOQsAyq36yzt0BRYUw&s',
      },
      {
        'address': '456 Elm St, Metropolis',
        'name': 'Jane Smith',
        'mobile': '+0987654321',
        'email': 'janesmith@example.com',
        'car': 'Honda Accord',
        'status': 'Inactive',
         'photo_image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbyGe_NxWJEQaC-Ro114LapbLeIf6iO8Ayimi99xeA_ilhUI67u07B5TaAnf8rLAkiD6c&usqp=CAU',
      },
      {
        'address': '789 Oak St, Gotham',
        'name': 'Bruce Wayne',
        'mobile': '+1122334455',
        'email': 'brucewayne@example.com',
        'car': 'Lamborghini Aventador',
        'status': 'Active',
         'photo_image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKgVyzdlvRNdVeUGuejy83xZ2e0fsRDoGfb7XUQbLI1kc7YANSXyW1toKYwNl4fi-baU4&usqp=CAU',
      },
    ];

    // Convert sample data to list of TenantModel
    return sampleData.map((data) => TenantModel.fromJson(data)).toList();
  }
}
