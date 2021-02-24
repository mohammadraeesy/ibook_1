import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/features/forgot_password/domain/use_cases/chek_verify_code_usecase.dart';
import 'package:flutter_app_clean_auth/features/forgot_password/domain/use_cases/forgot_password_usecase.dart';

part 'forgot_password_event.dart';

part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final CheckVerifyCodeUseCase checkVerifyCodeUseCase;

  ForgotPasswordBloc(
      {@required this.checkVerifyCodeUseCase,
      @required this.forgotPasswordUseCase})
      : assert(checkVerifyCodeUseCase != null),
        assert(forgotPasswordUseCase != null),
        super(Empity());

  @override
  Stream<ForgotPasswordState> mapEventToState(
    ForgotPasswordEvent event,
  ) async* {
    if (event is SendVerifyCodeEvent) {
      yield LoadingForgotPasswordState();
      final faliororForgotPassword =
          await forgotPasswordUseCase(ForgotPasswordParams(email: event.email));
      yield* faliororForgotPassword.fold((left) async* {
        yield ErrorForgotPasswordState(massage: 'Error');
      }, (right) async* {
        if (right) {
          yield LoadedForgotPasswordState(massage: "successfully");
        } else {
          yield ErrorForgotPasswordState(massage: 'Error');
        }
      });
    } else if (event is SubmitEvent) {
      yield LoadingForgotPasswordState();
      if (event.password1 == event.password2){
        final faliorOrSubmit = await checkVerifyCodeUseCase(Params(
            password: event.password1,
            verifyCode: event.verifyCode,
            username: event.username));
        yield* faliorOrSubmit.fold((left) async* {
          yield ErrorForgotPasswordState(massage: 'Error');
        }, (right) async* {
          if (right) {
            yield LoadedForgotPasswordState(massage: "successfully");
          } else {
            yield ErrorForgotPasswordState(massage: 'Error');
          }
        });
      }
      else {
        yield ErrorForgotPasswordState(massage: 'Error');
      }
    }
  }
}
