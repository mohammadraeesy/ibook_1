part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {}

class SendVerifyCodeEvent extends ForgotPasswordEvent {
  final String email;

  SendVerifyCodeEvent({@required this.email});

  @override
  // TODO: implement props
  List<Object> get props => [email];
}

class SubmitEvent extends ForgotPasswordEvent {
  final String password1;
  final String password2;
  final String verifyCode;
  final String username;
  SubmitEvent({@required this.password1, @required this.verifyCode,@required this.username,@required this.password2});

  @override
  // TODO: implement props
  List<Object> get props => [password1,password2,username, verifyCode];
}
