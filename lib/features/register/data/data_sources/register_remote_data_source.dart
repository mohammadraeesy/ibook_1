import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/exceptions.dart';
import 'package:flutter_app_clean_auth/features/register/data/models/register_model.dart';
import 'package:http/http.dart' as http;

abstract class RegisterRemoteDataSource {
  Future<bool> register(RegisterModel registerModel);
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final http.Client client;

  RegisterRemoteDataSourceImpl({@required this.client});

  @override
  Future<bool> register(RegisterModel registerModel) async {
    try{
      final String url = 'http://192.168.43.10:8762/auth/users';
      final response = await client.post(url,
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          body: json.encode(registerModel.toJson())).timeout(Duration(seconds: 6));
      if (response.statusCode == 201) {
        return true;
      } else {
        throw ServerException();
      }
    }catch (exception){
      throw ServerException();
    }
  }
}
