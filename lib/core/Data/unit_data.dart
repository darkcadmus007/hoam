import 'package:hoam_v1/core/models/units_model.dart';

import '../models/car_model.dart';

class UnitService {
  Future<List<UnitModel>> getSampleUnits() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    // Sample data
    List<Map<String, dynamic>> sampleData = [
    {
        "unit_id": 1,
        "name": "Maple House",
        "address": "123 Maple Street, Springfield",
        "house_img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNc1rrd7gNMvqbK7C0TMb_LAnDcPXdtWieBw&s",
        "price": 350000.00,
        "bedrooms": 3,
        "bathrooms": 2,
        "square_footage": 1500,
        "description": "A cozy 3-bedroom house in the city.",
        "status": "Available"
    },
    {
        "unit_id": 2,
        "name": "Oak Villa",
        "address": "456 Oak Avenue, Springfield",
        "house_img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmt4TAUT-Pc2phPWZ5NadwAfiKCEtGokcMXdlFiEw-nBuyU2t55SfgP2d7dmlx6u2Od0I&usqp=CAU",
        "price": 550000.00,
        "bedrooms": 4,
        "bathrooms": 3,
        "square_footage": 2500,
        "description": "A spacious villa with a big garden.",
        "status": "Sold"
    },
    {
        "unit_id": 3,
        "name": "Pine Cottage",
        "address": "789 Pine Road, Springfield",
        "house_img": "https://www.realestate.com.au/blog/wp-content/uploads/2016/04/Units-550.jpg",
        "price": 275000.00,
        "bedrooms": 2,
        "bathrooms": 1,
        "square_footage": 1200,
        "description": "A charming cottage with a cozy interior.",
        "status": "Pending"
    },
    {
        "unit_id": 4,
        "name": "Cedar Townhouse",
        "address": "321 Cedar Street, Springfield",
        "house_img": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCT3k2iS7pzf5O-5IxKG4pe9Nua2cAPbMrRw&s",
        "price": 450000.00,
        "bedrooms": 3,
        "bathrooms": 2,
        "square_footage": 1800,
        "description": "A modern townhouse with an open floor plan.",
        "status": "Available"
    },
    {
        "unit_id": 5,
        "name": "Birch Estate",
        "address": "654 Birch Boulevard, Springfield",
        "house_img": "https://www.bhg.com/thmb/JEdsVvKYXrAR88Z6PLIxYK70X6E=/1647x0/filters:no_upscale():strip_icc()/adu-accessory-dwelling-unit-guide-ad2e55fa1d8c47baac5d5baa2f29cd3b.jpg",
        "price": 700000.00,
        "bedrooms": 5,
        "bathrooms": 4,
        "square_footage": 3200,
        "description": "A luxurious estate with a pool and home theater.",
        "status": "Sold"
    }
]
;

    // Convert sample data to list of CarModel
    return sampleData.map((data) => UnitModel.fromJson(data)).toList();
  }
}
