import 'package:flutter/cupertino.dart';

class RegisterModel {
  final String username;
  final String password;
  final String phonenumber;
  final String email;
  final String firstname;
  final String lastname;

  RegisterModel(
      {@required this.username,
        @required this.password,
        @required this.phonenumber,
        @required this.email,
        @required this.firstname,
        @required this.lastname});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      username: json['username'],
      password: json['password'],
      phonenumber: json['phonenumber'],
      email: json['email'],
      firstname: json['name'],
      lastname: json['lastname'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'phonenumber': phonenumber,
      'email': email,
      'name': firstname,
      'lastname': lastname,
    };
  }
}
