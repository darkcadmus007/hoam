class GuestsModel {
  final String name;
  final String carPlateNo;
  final String color;
  final String date;
  final String status;

  GuestsModel({
    required this.name,
    required this.carPlateNo,
    required this.color,
    required this.date,
    required this.status,
  });

  // You can also add methods for parsing from/to JSON if needed
  factory GuestsModel.fromJson(Map<String, dynamic> json) {
    return GuestsModel(
      name: json['name'],
      carPlateNo: json['carPlateNo'],
      color: json['color'],
      date: json['date'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'carPlateNo': carPlateNo,
      'color': color,
      'date': date,
      'status': status,
    };
  }
}
