class UnitModel {
  int? unitId;
  String? name;
  String? address;
  String? houseImg;
  double? price;
  int? bedrooms;
  int? bathrooms;
  int? squareFootage;
  String? description;
  String? status;
  String? createdAt;

  UnitModel(
      {this.unitId,
      this.name,
      this.address,
      this.houseImg,
      this.price,
      this.bedrooms,
      this.bathrooms,
      this.squareFootage,
      this.description,
      this.status,
      this.createdAt});

  UnitModel.fromJson(Map<String, dynamic> json) {
    unitId = json['unit_id'];
    name = json['name'];
    address = json['address'];
    houseImg = json['house_img'];
    price = json['price'];
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    squareFootage = json['square_footage'];
    description = json['description'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit_id'] = this.unitId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['house_img'] = this.houseImg;
    data['price'] = this.price;
    data['bedrooms'] = this.bedrooms;
    data['bathrooms'] = this.bathrooms;
    data['square_footage'] = this.squareFootage;
    data['description'] = this.description;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}