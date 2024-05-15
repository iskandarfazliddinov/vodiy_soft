import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vodiy_soft/core/network/urls.dart';
import 'package:vodiy_soft/features/login/data/dto/data_response_dto.dart';
import 'package:vodiy_soft/features/login/data/dto/login_request_dto.dart';
part 'login_services.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class LoginService {
  factory LoginService(Dio dio) = _LoginService;

  @POST("token/")
  Future<HttpResponse<DataResponseDto>> login({
    @Body() required LoginRequestDto loginRequest,
  });
}
