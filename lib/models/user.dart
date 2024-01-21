// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;

  String email;

  String password;

  String phoneNo;
  User({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'phoneNo': phoneNo,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      phoneNo: map['phoneNo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
  factory User.fromDocument(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    return User(
        name: data['name'],
        email: data['email'],
        password: data['password'],
        phoneNo: data['phoneNo']
        // Map other properties accordingly
        );
  }
}
