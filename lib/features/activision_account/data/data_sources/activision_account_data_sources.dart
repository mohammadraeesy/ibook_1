import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/exceptions.dart';
import 'package:flutter_app_clean_auth/features/activision_account/data/models/activision_account_model.dart';
import 'package:http/http.dart' as http;
abstract class ActivisionAccountDataSource {
  Future<bool> activisionAccount (ActivisionAccountModel activisionAccountModel);
}
class ActivisionAccountDataSourceImpl implements ActivisionAccountDataSource{
  final http.Client client;
  ActivisionAccountDataSourceImpl({@required this.client});

  @override
  Future<bool> activisionAccount(ActivisionAccountModel activisionAccountModel)async {
    try {
      final String url = '';
      final response = await client.post(url,
          headers: {'Content-Type': 'application/json; charset=utf-8'},
          body: json.encode(activisionAccountModel.toJson()));
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
