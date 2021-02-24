part of 'activision_bloc.dart';

@immutable
abstract class ActivisionState extends Equatable {}

class EmpityStateActivisionAccount extends ActivisionState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadinStateActivisionAccount extends ActivisionState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedStateActivisionAccount extends ActivisionState {
  final String massage;

  LoadedStateActivisionAccount({@required this.massage});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
class ErrorStateActivisionAccount extends ActivisionState{
  final String massage;
  ErrorStateActivisionAccount({@required this.massage});

  @override
  // TODO: implement props
  List<Object> get props => [massage];
}
