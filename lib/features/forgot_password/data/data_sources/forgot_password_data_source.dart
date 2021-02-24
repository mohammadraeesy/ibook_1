import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/exceptions.dart';
import 'package:flutter_app_clean_auth/features/forgot_password/data/models/check_verify_code_model.dart';
import 'package:flutter_app_clean_auth/features/forgot_password/data/models/forgot_password_model.dart';
import 'package:http/http.dart' as http;

abstract class ForgotPasswordDataSource {
  Future<bool> forgotPassword(ForgotPasswordModel forgotPasswordModel);

  Future<bool> checkVerifyCode(CheckVerifyModel checkVerifyModel);
}

class ForgotPasswordDataSourceImpl implements ForgotPasswordDataSource {
  final http.Client client;

  ForgotPasswordDataSourceImpl({@required this.client});

  @override
  Future<bool> forgotPassword(ForgotPasswordModel forgotPasswordModel) async {
    try {
      final String url = '';
      final response = await client.post(url,
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          body: json.encode(forgotPasswordModel.toJson()));
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (exception) {
      throw ServerException();
    }
  }

  @override
  Future<bool> checkVerifyCode(CheckVerifyModel checkVerifyModel) async {
    try {
      final String url = '';
      final response = await client.post(url,
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          body: json.encode(checkVerifyModel.toJson()));
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (exception) {
      throw ServerException();
    }
  }
}
