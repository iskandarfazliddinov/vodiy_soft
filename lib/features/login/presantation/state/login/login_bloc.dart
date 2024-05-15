import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:vodiy_soft/core/resources/data_state.dart';
import 'package:vodiy_soft/core/resources/state_status.dart';
import 'package:vodiy_soft/features/login/data/dto/login_request_dto.dart';
import 'package:vodiy_soft/features/login/domain/repositories/login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo loginRepo;

  LoginBloc({required this.loginRepo}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
    on<SendCredentials>(_sendCredentials);
  }

  Future<FutureOr<void>> _sendCredentials(
      SendCredentials event, Emitter<LoginState> emit) async {
    emit(LoginInitial());
    final Map<String, String?> auth = {
      'value': null,
      'password': null,
      'error': null,
    };
    bool hasError = false;


    if (!hasError) {
      emit(LoginInitial(status: StateStatus.loading));

      final result = await loginRepo.login(
        loginRequestDto: event.loginRequestDto,
      );

      if (result is DataSuccess) {
        emit(Success());
      } else {
        auth['error'] = result.errorResponse?.error??
            result.errorResponse?.message ??
            "something_went_wrong";
        hasError = true;
      }
    }

    if (hasError) {
      emit(LoginInitial(status: StateStatus.error, errorData: auth));
    }
  }
}
