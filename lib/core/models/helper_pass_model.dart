class HelperPassModel {
  final String name;
  final String gender;
  final String photoImg;
  final String specialInstruction;
  final bool hasBag;
  final String status;

  HelperPassModel({
    required this.name,
    required this.gender,
    required this.photoImg,
    required this.specialInstruction,
    required this.hasBag,
    required this.status,
  });

  // You can also add methods for parsing from/to JSON if needed
  factory HelperPassModel.fromJson(Map<String, dynamic> json) {
    return HelperPassModel(
      name: json['name'],
      gender: json['gender'],
      photoImg: json['photo_img'],
      specialInstruction: json['special_instruction'],
      hasBag: json['has_bag'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'gender': gender,
      'photo_img': photoImg,
      'special_instruction': specialInstruction,
      'has_bag': hasBag,
      'status': status,
    };
  }
}
