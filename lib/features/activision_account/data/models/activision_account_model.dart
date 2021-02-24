import 'package:flutter/cupertino.dart';

class ActivisionAccountModel{
  final String username;
  final String activisionCode;
  ActivisionAccountModel({@required this.username,@required this.activisionCode});
  Map<String, dynamic> toJson(){
    return {
      'username':username,
      'activisionCode':activisionCode
    };
  }
}