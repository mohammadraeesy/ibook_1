import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';

abstract class ForgotPasswordRepository {
  Future<Either<Failure, bool>> forgotPassword({@required String email});
  Future<Either<Failure, bool>> checkVerifyCode({@required String password,@required String verifyCode,@required String username});
}