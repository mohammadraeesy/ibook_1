part of 'activision_bloc.dart';

@immutable
abstract class ActivisionEvent extends Equatable{}
class BottomClickEventActivision extends ActivisionEvent{
  final String username;
  final String verifyCode;
  BottomClickEventActivision({@required this.username,@required this.verifyCode});

  @override
  // TODO: implement props
  List<Object> get props => [username,verifyCode];
}
