part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class SendCredentials extends LoginEvent{
  final LoginRequestDto loginRequestDto;

  const SendCredentials({required this.loginRequestDto});


  @override
  List<Object?> get props => [loginRequestDto];
}