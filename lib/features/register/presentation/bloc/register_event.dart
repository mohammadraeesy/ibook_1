part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class clickButtomPress extends RegisterEvent {
  final String username;
  final String password;
  final String phonenumber;
  final String email;
  final String firstname;
  final String lastname;

  clickButtomPress(
      {@required this.username,
      @required this.password,
      @required this.phonenumber,
      @required this.email,
      @required this.firstname,
      @required this.lastname});

  @override
  List<Object> get props =>
      [username, password, phonenumber, email, firstname, lastname];
}
