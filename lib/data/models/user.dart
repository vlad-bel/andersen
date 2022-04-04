import 'dart:convert' as dartConvert;

import 'package:drift/drift.dart';

String encodeUserToString(User user) => dartConvert.json.encode(user.toMap());

class User {
  const User({
    this.id,
    this.email,
    this.registerTime,
    this.password,
  });

  final int? id;
  final String? email;
  final DateTime? registerTime;
  final String? password;

  factory User.fromMap(Map<String, dynamic>? map) {
    if (map == null) throw ('user_from_map_error');

    return User(
      id: map['id'],
      email: map['email'],
      registerTime: map['register_time'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['register_time'])
          : null,
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'register_time': registerTime?.millisecondsSinceEpoch,
      'password': password,
    };
  }

  User copyWith({
    int? id,
    String? email,
    DateTime? registerTime,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      registerTime: registerTime ?? this.registerTime,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return 'User{id: $id, email: $email, registerTime: $registerTime, password: $password}';
  }
}
