import 'package:vodiy_soft/core/resources/data_state.dart';
import 'package:vodiy_soft/features/main/data/dto/distance_request_dto.dart';
import 'package:vodiy_soft/features/main/data/dto/distance_response_dto.dart';

abstract class MainRepo{

  Future<DataState<DistanceResponseDto>> getDistance({
    required DistanceRequestDto distanceRequestDto,
});

}