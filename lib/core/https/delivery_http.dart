import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hoam_v1/core/models/delivery_model.dart';
import 'package:http/http.dart' as http;

class DeliveryHttp {
  final BuildContext context;

  DeliveryHttp(this.context);

  Future<List<DeliveryModel>> getDeliveries(int page) async {
   final resp = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts?_page=$page'));
    if (resp.statusCode == 200) {

       List<dynamic> jsonList  = json.decode(resp.body);
      return jsonList.map((json) => DeliveryModel.fromJson(json)).toList();
    }

    return [];
  }

  
}
