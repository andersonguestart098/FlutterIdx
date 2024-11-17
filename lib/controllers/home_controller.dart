import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/model/notification_model.dart';

import 'package:http/http.dart' as http;

class HomeController {
  Future<List<NotificationModel>?>? fetchPosts() async {
    try {
      final response = await http
          .get(Uri.parse('https://cemear-b549eb196d7c.herokuapp.com/posts'));

      if (response.statusCode != 200) {
        throw Exception('Erro ao buscar posts: ${response.statusCode}');
      }
      final List<dynamic> jsonList = jsonDecode(response.body);
      final List<NotificationModel> notifications = jsonList
          .map((jsonItem) => NotificationModel.fromMap(jsonItem))
          .toList();
      return notifications;
    } catch (error) {
      debugPrint('Erro ao buscar posts: $error');
    }
    return null;
  }
}
