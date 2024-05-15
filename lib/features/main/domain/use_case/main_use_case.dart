
import 'package:vodiy_soft/core/resources/data_state.dart';
import 'package:vodiy_soft/features/main/data/dto/distance_request_dto.dart';
import 'package:vodiy_soft/features/main/data/dto/distance_response_dto.dart';
import 'package:vodiy_soft/features/main/domain/repositories/main_repo.dart';

class MainUseCase{
  final MainRepo mainRepo;

  MainUseCase({required this.mainRepo});

  Future<DataState<DistanceResponseDto>> getDistance({
    required DistanceRequestDto distanceRequestDto,
})async{
    return await mainRepo.getDistance(distanceRequestDto: distanceRequestDto);
  }



}