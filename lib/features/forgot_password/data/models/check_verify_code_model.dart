import 'package:flutter/cupertino.dart';

class CheckVerifyModel {
  final String password;
  final String verifyCode;
  final String username;
  CheckVerifyModel({@required this.password, @required this.verifyCode,@required this.username});
  Map<String, dynamic> toJson(){
    return {
      'username':username,
      'password':password,
      'verifyCode':verifyCode
    };
  }
}
