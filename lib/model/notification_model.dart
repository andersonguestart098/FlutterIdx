import 'dart:convert';

import 'user_model.dart';

class NotificationModel {
  final String id;
  final String titulo;
  final String conteudo;
  final String? imagePath;
  final DateTime createdAt;
  final String userId;
  final UserModel? user;

  NotificationModel({
    required this.id,
    required this.titulo,
    required this.conteudo,
    this.imagePath,
    required this.createdAt,
    required this.userId,
    this.user,
  });

  // Método fromMap
  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'] ?? '',
      titulo: map['titulo'] ?? '',
      conteudo: map['conteudo'] ?? '',
      imagePath: map['imagePath'],
      createdAt: DateTime.parse(map['created_at']),
      userId: map['userId'] ?? '',
      user: map['user'] != null ? UserModel.fromMap(map['user']) : null,
    );
  }

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'conteudo': conteudo,
      'imagePath': imagePath,
      'created_at': createdAt.toIso8601String(),
      'userId': userId,
      'user': user?.toMap(),
    };
  }

  // Método fromJson
  factory NotificationModel.fromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return NotificationModel.fromMap(json);
  }

  // Método toJson
  String toJson() {
    return jsonEncode(toMap());
  }
}
