import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/core/usecases/usecases.dart';
import 'package:flutter_app_clean_auth/features/forgot_password/domain/repositories/forgot_password_repository.dart';

class CheckVerifyCodeUseCase implements UseCase<bool, Params> {
  final ForgotPasswordRepository repository;

  CheckVerifyCodeUseCase({@required this.repository});

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.checkVerifyCode(
        password: params.password, verifyCode: params.verifyCode,username: params.username);
  }
}

class Params extends Equatable {
  final String password;
  final String verifyCode;
  final String username;

  Params(
      {@required this.password,
      @required this.verifyCode,
      @required this.username});

  @override
  // TODO: implement props
  List<Object> get props => [password, verifyCode];
}
