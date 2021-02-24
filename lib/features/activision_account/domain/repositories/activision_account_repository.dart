import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';

abstract class ActivisionAccountRepository{
  Future<Either<Failure, bool>> activationAccount({@required String username,@required String verifyCode});
}