import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:vodiy_soft/core/resources/data_state.dart';
import 'package:vodiy_soft/features/main/data/dto/distance_request_dto.dart';
import 'package:vodiy_soft/features/main/data/dto/distance_response_dto.dart';
import 'package:vodiy_soft/features/main/domain/use_case/main_use_case.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainUseCase mainUseCase;

  MainBloc({
    required this.mainUseCase,
}) : super(MainInitial()) {

    on<MainRequestEvent>((event, emit) async{
      emit(MainInitial());
      Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final response = await mainUseCase.getDistance(distanceRequestDto: event.distanceRequestDto);

      if(response is DataSuccess){
        emit(MainLoaded(distanceResponseDto: response.data, position: pos));
      }else{
        emit(MainError(error: response.errorResponse?.message??"Error", position: pos));
      }
    });
  }
}
