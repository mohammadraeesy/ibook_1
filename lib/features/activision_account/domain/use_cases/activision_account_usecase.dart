import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/core/usecases/usecases.dart';
import 'package:flutter_app_clean_auth/features/activision_account/domain/repositories/activision_account_repository.dart';

class ActivisionAccountUsecase implements UseCase<bool, ActivisionParems> {
  final ActivisionAccountRepository repository;

  ActivisionAccountUsecase({@required this.repository});

  @override
  Future<Either<Failure, bool>> call(ActivisionParems params) async {
    return await repository.activationAccount(
        username: params.username, verifyCode: params.verifyCode);
  }

}

class ActivisionParems extends Equatable {
  final String username;
  final String verifyCode;

  ActivisionParems({@required this.username, @required this.verifyCode});

  @override
  // TODO: implement props
  List<Object> get props => [username, verifyCode];

}