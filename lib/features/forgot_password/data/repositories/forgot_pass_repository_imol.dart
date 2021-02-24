import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/exceptions.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/core/network/network_info.dart';
import 'package:flutter_app_clean_auth/features/forgot_password/data/data_sources/forgot_password_data_source.dart';
import 'package:flutter_app_clean_auth/features/forgot_password/data/models/check_verify_code_model.dart';
import 'package:flutter_app_clean_auth/features/forgot_password/data/models/forgot_password_model.dart';
import 'package:flutter_app_clean_auth/features/forgot_password/domain/repositories/forgot_password_repository.dart';

class ForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  final ForgotPasswordDataSource dataSource;
  final NetworkInfo networkInfo;

  ForgotPasswordRepositoryImpl(
      {@required this.networkInfo, @required this.dataSource});

  @override
  Future<Either<Failure, bool>> forgotPassword({String email}) async {
    if (await networkInfo.isConnected) {
      try {
        final respons =
            await dataSource.forgotPassword(ForgotPasswordModel(email: email));

        return Right(respons);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, bool>> checkVerifyCode(
      {String password, String verifyCode,String username}) async {
    if (await networkInfo.isConnected) {
      try {
        final respons = await dataSource.checkVerifyCode(
            CheckVerifyModel(password: password, verifyCode: verifyCode,username: username));

        return Right(respons);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }
}
