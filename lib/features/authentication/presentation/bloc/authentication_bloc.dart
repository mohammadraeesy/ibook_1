import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_clean_auth/core/error/failures.dart';
import 'package:flutter_app_clean_auth/core/usecases/usecases.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/check_token_authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/delete_token_authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/find_token_authentication.dart';
import 'package:flutter_app_clean_auth/features/authentication/domain/use_cases/save_token_authentication.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SaveToken saveToken;
  final DeleteToken deleteToken;
  final CheckToken checkTokenUseCase;
  final FindToken findToken;

  AuthenticationBloc(
      {@required this.saveToken,
      @required this.deleteToken,
      @required this.checkTokenUseCase,
      @required this.findToken})
      : assert(saveToken != null),
        assert(deleteToken != null),
        assert(checkTokenUseCase != null),
        super(Empty());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is logIn) {
      //AuthenticationLoading
      yield* _mapLoggedInToState(
          event.token, event.refreshToken, event.expiredToken);
    } else if (event is logOut) {
      //AuthenticationLoading
      yield* _mapLoggedOutToState();
    } else if (event is CheckAccount) {
      // develop later
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      // await findToken(NoParams())
      final Either<Failure, bool> token = await checkTokenUseCase(NoParams());
      //Set this duration to show splash screen.
      await Future.delayed(const Duration(seconds: 4));
      yield* token.fold((left) async* {
        yield Unauthenticated();
      }, (right) async* {
        if (right) {
          yield Authenticated();
        } else {
          yield Unauthenticated();
        }
      });
      // if (token != null && token.ri == true) {
      //   yield Authenticated();
      // } else {
      //   yield Unauthenticated();
      // }
    } catch (exception) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState(
      String token, String refreshToken, String expiredToken) async* {
    final checkBoolSave = await saveToken(Params(
        token: token, refreshToken: refreshToken, expiredToken: expiredToken));
    if (checkBoolSave.isRight() == true) {
      yield Authenticated();
    } else {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    /// Remove user credentials from device storage.
    await deleteToken(NoParams());
    yield Unauthenticated();
  }

  Stream<AuthenticationState> _isTokenValid({@required bool token}) async* {
    if (token) {
      yield Authenticated();
    } else {
      yield Unauthenticated();
    }
  }
}
