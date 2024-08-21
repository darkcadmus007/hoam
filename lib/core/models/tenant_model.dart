class TenantModel {
  final String address;
  final String name;
  final String mobile;
  final String email;
  final String car;
  final String status;
  final String photoImg;

  TenantModel({
    required this.address,
    required this.name,
    required this.mobile,
    required this.email,
    required this.car,
    required this.status,
    required this.photoImg,
  });

  factory TenantModel.fromJson(Map<String, dynamic> json) {
    return TenantModel(
      address: json['address'],
      name: json['name'],
      mobile: json['mobile'],
      email: json['email'],
      car: json['car'],
      status: json['status'],
        photoImg: json['photo_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'name': name,
      'mobile': mobile,
      'email': email,
      'car': car,
      'status': status,
      'photo_image': photoImg,
    };
  }
}
