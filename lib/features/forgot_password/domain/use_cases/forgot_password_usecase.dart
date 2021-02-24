import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/core/usecases/usecases.dart';
import 'package:flutter_app_clean_auth/features/forgot_password/domain/repositories/forgot_password_repository.dart';

class ForgotPasswordUseCase implements UseCase<bool, ForgotPasswordParams> {
  final ForgotPasswordRepository repository;

  ForgotPasswordUseCase({@required this.repository});

  @override
  Future<Either<Failure, bool>> call(ForgotPasswordParams params) async{
    return await repository.forgotPassword(email: params.email);
  }
}

class ForgotPasswordParams extends Equatable {
  final String email;

  ForgotPasswordParams({@required this.email});

  @override
  // TODO: implement props
  List<Object> get props => [email];
}
