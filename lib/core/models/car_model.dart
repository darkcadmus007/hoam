class CarModel {
  final String plateNumber;
  final String color;
  final String model;
  final String photo;
  final String sticker;
  final String status;

  CarModel({
    required this.plateNumber,
    required this.color,
    required this.model,
    required this.photo,
    required this.sticker,
    required this.status,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      plateNumber: json['plate_number'],
      color: json['color'],
      model: json['model'],
      photo: json['photo'],
      sticker: json['sticker'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'plate_number': plateNumber,
      'color': color,
      'model': model,
      'photo': photo,
      'sticker': sticker,
      'status': status,
    };
  }
}
