part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState extends Equatable {}

class Empity extends ForgotPasswordState {
  @override
  List<Object> get props => [];
}

class LoadingForgotPasswordState extends ForgotPasswordState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedForgotPasswordState extends ForgotPasswordState {
  final String massage;

  LoadedForgotPasswordState({@required this.massage});

  @override
  // TODO: implement props
  List<Object> get props => [massage];
}
class ErrorForgotPasswordState extends ForgotPasswordState{
  final String massage;
  ErrorForgotPasswordState({@required this.massage});

  @override
  // TODO: implement props
  List<Object> get props => [massage];
}
