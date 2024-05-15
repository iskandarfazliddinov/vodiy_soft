import 'package:vodiy_soft/core/resources/data_state.dart';
import 'package:vodiy_soft/features/login/data/dto/data_response_dto.dart';
import 'package:vodiy_soft/features/login/data/dto/login_request_dto.dart';

abstract class LoginRepo {

  Future<DataState<DataResponseDto>> login({
    required LoginRequestDto loginRequestDto,
  });

}
