import '../models/car_model.dart';

class CarService {
  Future<List<CarModel>> getSampleCars() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));

    // Sample data
    List<Map<String, dynamic>> sampleData = [
      {
        'plate_number': 'ABC 123',
        'color': 'Red',
        'model': 'Toyota Camry',
        'photo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkWrX4Z_9GR-oLrf7sAcdxMALgkUob5yFgUg&s',
        'sticker': 'VIP',
        'status': 'Active',        
      },
      {
        'plate_number': 'XYZ 456',
        'color': 'Blue',
        'model': 'Honda Accord',
        'photo': 'https://dealer-content.s3.amazonaws.com/images/models/honda/2021/accord/colors/still-night-pearl.png',
        'sticker': 'Regular',
        'status': 'Inactive',
      },
      {
        'plate_number': 'LMN 789',
        'color': 'White',
        'model': 'Ford Explorer',
        'photo': 'https://di-uploads-pod41.dealerinspire.com/depaulaford/uploads/2020/06/2017-Ford-Explorer-Albany-NY-White.jpg',
        'sticker': 'VIP',
        'status': 'Active',
      },
      {
        'plate_number': 'QWE 123',
        'color': 'Yellow',
        'model': 'Nissan Juke',
        'photo': 'https://mir-s3-cdn-cf.behance.net/project_modules/fs/dc0c0925007623.58ae133110941.jpg',
        'sticker': 'Regular',
        'status': 'Inactive',
      },
      {
        'plate_number': 'ASD 543',
        'color': 'Black',
        'model': 'Toyota Vios',
        'photo': 'https://imgcdnblog.carmudi.com.ph/wp-content/uploads/2021/04/16123311/toyota-vios-2.jpg',
        'sticker': 'Regular',
        'status': 'Active',
      },
      {
        'plate_number': 'ZZZ 999',
        'color': 'orange',
        'model': 'Suzuki S-Presso',
        'photo': 'https://images.topgear.com.ph/topgear/images/2022/03/22/suzuki-s-presso-2021-main-1647945552.jpg',
        'sticker': 'VIP',
        'status': 'Active',
      },
      {
        'plate_number': 'POI 987',
        'color': 'Gray',
        'model': 'Toyota Hilux',
        'photo': 'https://imgcdnblog.carmudi.com.ph/wp-content/uploads/2020/10/08100722/hilux-silver-metallic.jpg',
        'sticker': 'VIP',
        'status': 'Inactive',
      },
      {
        'plate_number': 'LKJ 654',
        'color': 'White',
        'model': 'Kia Seltos',
        'photo': 'https://imgd-ct.aeplcdn.com/1056x660/n/ima73cb_1726651.jpg?q=80',
        'sticker': 'Regular',
        'status': 'Active',
      },
      {
        'plate_number': 'MNB 321',
        'color': 'Black',
        'model': 'BMW iX1',
        'photo': 'https://stimg.cardekho.com/images/car-images/large/BMW/iX1/9127/1711945748933/223_Black-Sapphire_1c1c1c.jpg?impolicy=resize&imwidth=420',
        'sticker': 'VIP',
        'status': 'Active',
      },
    ];

    // Convert sample data to list of CarModel
    return sampleData.map((data) => CarModel.fromJson(data)).toList();
  }
}
