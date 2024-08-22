class ReminderModel {
  String? title;
  String? description;
  String? date;

  ReminderModel({this.title, this.description, this.date});

  ReminderModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['date'] = this.date;
    return data;
  }
}