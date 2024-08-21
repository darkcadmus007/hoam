class DeliveryModel {
  final String id;
  final String title;
  final String date;
  final String type;

  DeliveryModel({
    required this.id,
    required this.title,
    required this.date,
    required this.type,
  });

  factory DeliveryModel.fromJson(Map<String, dynamic> json) {
    return DeliveryModel(
      id: json['id'] as String,
      title: json['title'] as String,
      date: json['date'],
      type: json['type'] as String,
    );
  }
}
