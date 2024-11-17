import 'dart:convert';

class UserModel {
  final String id;
  final String usuario;
  final String? avatar;

  UserModel({
    required this.id,
    required this.usuario,
    this.avatar,
  });

  // Método fromMap
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      usuario: map['usuario'] ?? '',
      avatar: map['avatar'],
    );
  }

  // Método toMap
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'usuario': usuario,
      'avatar': avatar,
    };
  }

  // Método fromJson
  factory UserModel.fromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return UserModel.fromMap(json);
  }

  // Método toJson
  String toJson() {
    return jsonEncode(toMap());
  }
}
