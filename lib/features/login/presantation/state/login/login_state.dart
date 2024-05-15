part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  final StateStatus status;
  final Map<String, String?>? errorData;

  LoginInitial({
    this.status = StateStatus.normal,
    this.errorData,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [status];
}

class Success extends LoginState{
  @override
  List<Object> get props => [];
}