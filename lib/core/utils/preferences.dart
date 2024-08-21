import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:vmatch/core/https/http_connection.dart';
// import 'package:vmatch/core/models/user.dart'; 

class Preferences {
  final SharedPreferences shared;

  Preferences(this.shared);

  bool get acceptPolicy => shared.getBool("accept_policy") ?? false;

  ThemeMode get theme => ThemeMode.values[shared.getInt("theme") ?? 0];
  set theme(ThemeMode mode) {
    shared.setInt("theme", mode.index);
  }

  set acceptPolicy(bool value) => shared.setBool("accept_policy", value);

  set token(String? value) => shared.setString("token", value!);

  String? get token => shared.getString("token");

  List<String> get notificationSetting =>
      shared.getStringList("notification_settings") ?? [];

  // void addUserLogin(String token, User user) {
  //   var list = shared.getStringList("users") ?? [];
  //   list.removeWhere((element) => element.contains(token));
  //   list.removeWhere((element) {
  //     try {
  //       var savedUser = User.fromJson(jsonDecode(element)["user"]);
  //       if (savedUser.id == user.id) {
  //         return true;
  //       }
  //     } catch (_) {}

  //     return false;
  //   });
  //   list.add(jsonEncode({"token": token, "user": user.toJson()}));
  //   shared.setStringList("users", list);
  // }

  // void removeUserLogin(String token) {
  //   var list = shared.getStringList("users") ?? [];
  //   list.removeWhere((element) => element.contains(token));
  //   shared.setStringList("users", list);
  // }

  // List<Map<String, dynamic>> get loadUsers {
  //   return (shared.getStringList("users") ?? []).map((e) {
  //     var data = jsonDecode(e);
  //     return {
  //       "token": data["token"],
  //       "user": User.fromJson(data["user"]),
  //     };
  //   }).toList();
  // }

  static Future<Preferences> instance() =>
      SharedPreferences.getInstance().then((value) => Preferences(value));

  // Future<void> enableNotificationSettings(int userId, String key, bool value) async {
  //   List<String> settings = List.from(notificationSetting);
  //   if (value) {
  //     subscribeToTopic("${key}_$userId");
  //     if (!settings.contains(key)) {
  //       settings.add(key);
  //       await shared
  //           .setStringList("notification_settings", settings)
  //           .then((val) {});
  //     }
  //   } else {
  //     unsubscribeFromTopic("${key}_$userId");
  //     if (settings.contains(key)) {
  //       settings.remove(key);
  //       await shared
  //           .setStringList("notification_settings", settings)
  //           .then((val) {});
  //     }
  //   }
  // }
}
