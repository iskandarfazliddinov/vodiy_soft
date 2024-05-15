import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vodiy_soft/core/di/locator.dart';
import 'package:vodiy_soft/core/error/exception_handler.dart';
import 'package:vodiy_soft/core/resources/app_keys.dart';
import 'package:vodiy_soft/core/resources/data_state.dart';
import 'package:vodiy_soft/features/login/data/dto/data_response_dto.dart';
import 'package:vodiy_soft/features/login/data/dto/login_request_dto.dart';
import 'package:vodiy_soft/features/login/data/services/login_services.dart';
import 'package:vodiy_soft/features/login/domain/repositories/login_repo.dart';



class ImplLoginRepo extends LoginRepo {
  late SharedPreferences preferences;
  LoginService authService;

  ImplLoginRepo({
    required this.authService,
  }) {
    initialize();
  }

  void initialize() async {
    preferences = await SharedPreferences.getInstance();
  }

  _getError<T>(dynamic exception) => DataException.getError<T>(exception);

  @override
  Future<DataState<DataResponseDto>> login({required LoginRequestDto loginRequestDto}) async {

    try {
      String token = "";
      final response = await authService.login(
        loginRequest: loginRequestDto,
      );
      token = response.data.access??"";

      locator<Dio>().options.headers['Authorization'] = 'Bearer $token';
      preferences.setString(AppKeys.token, token);
      return DataSuccess<DataResponseDto>(data: response.data);
    } catch (e) {
      return _getError<DataResponseDto>(e);
    }
  }
}
