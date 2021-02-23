part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class clickButtonPress extends LoginEvent {
  final String username;
  final String password;

  clickButtonPress({@required this.username,@required this.password});

  @override
  List<Object> get props => [username,password];
}
