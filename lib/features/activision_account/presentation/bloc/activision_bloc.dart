import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app_clean_auth/features/activision_account/domain/use_cases/activision_account_usecase.dart';
import 'package:meta/meta.dart';

part 'activision_event.dart';

part 'activision_state.dart';

class ActivisionBloc extends Bloc<ActivisionEvent, ActivisionState> {
  final ActivisionAccountUsecase activisionAccountUsecase;

  ActivisionBloc({@required this.activisionAccountUsecase})
      : assert(activisionAccountUsecase != null),
        super(EmpityStateActivisionAccount());

  @override
  Stream<ActivisionState> mapEventToState(
    ActivisionEvent event,
  ) async* {
    if (event is BottomClickEventActivision){
      yield LoadinStateActivisionAccount();
      final faliorOrForgotPassword =
      await activisionAccountUsecase(ActivisionParems(username: event.username,verifyCode: event.verifyCode));
      yield* faliorOrForgotPassword.fold((left) async* {
        yield ErrorStateActivisionAccount(massage: 'Error');
      }, (right) async* {
        if (right) {
          yield LoadedStateActivisionAccount(massage: "successfully");
        } else {
          yield ErrorStateActivisionAccount(massage: 'Error');
        }
      });
    }
  }
}
