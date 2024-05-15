import 'package:vodiy_soft/core/error/exception_handler.dart';
import 'package:vodiy_soft/core/resources/data_state.dart';
import 'package:vodiy_soft/features/main/data/dto/distance_request_dto.dart';
import 'package:vodiy_soft/features/main/data/dto/distance_response_dto.dart';
import 'package:vodiy_soft/features/main/data/services/main_services.dart';
import 'package:vodiy_soft/features/main/domain/repositories/main_repo.dart';

class ImplMainRepo extends MainRepo {
  final MainService mainService;

  ImplMainRepo({required this.mainService});

  _getError<T>(dynamic exception) => DataException.getError<T>(exception);

  @override
  Future<DataState<DistanceResponseDto>> getDistance({
    required DistanceRequestDto distanceRequestDto,
  }) async {
    try {
      final response = await mainService.distance(
        distanceRequestDto: distanceRequestDto,
      );
      return DataSuccess(data: response.data);
    } catch (e) {
      return _getError<DistanceResponseDto>(e);
    }
  }
}
