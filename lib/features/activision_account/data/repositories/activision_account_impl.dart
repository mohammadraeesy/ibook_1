import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/exceptions.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/core/network/network_info.dart';
import 'package:flutter_app_clean_auth/features/activision_account/data/data_sources/activision_account_data_sources.dart';
import 'package:flutter_app_clean_auth/features/activision_account/data/models/activision_account_model.dart';
import 'package:flutter_app_clean_auth/features/activision_account/domain/repositories/activision_account_repository.dart';

class ActivisionAccountRepositoryImpl implements ActivisionAccountRepository {
  final ActivisionAccountDataSource dataSource;
  final NetworkInfo networkInfo;

  ActivisionAccountRepositoryImpl(
      {@required this.dataSource, @required this.networkInfo});

  @override
  Future<Either<Failure, bool>> activationAccount(
      {String username, String verifyCode}) async {
    if (await networkInfo.isConnected) {
      try {
        final respons = await dataSource.activisionAccount(
            ActivisionAccountModel(
                username: username,
                activisionCode: verifyCode
            )
        );
        return Right(respons);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else
      return Left(ServerFailure());
  }
}
