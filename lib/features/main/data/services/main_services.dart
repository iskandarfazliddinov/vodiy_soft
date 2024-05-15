import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vodiy_soft/core/network/urls.dart';
import 'package:vodiy_soft/features/main/data/dto/distance_request_dto.dart';
import 'package:vodiy_soft/features/main/data/dto/distance_response_dto.dart';
part 'main_services.g.dart';

@RestApi(baseUrl: Urls.baseURl)
abstract class MainService {
  factory MainService(Dio dio, {String baseUrl}) = _MainService;

  @POST("get_distance/")
  Future<HttpResponse<DistanceResponseDto>> distance({
    @Body() required DistanceRequestDto distanceRequestDto,
  });

}
