part of 'main_bloc.dart';

@immutable
abstract class MainState {}

 class MainInitial extends MainState {}

 class MainLoaded extends MainState {
  final DistanceResponseDto? distanceResponseDto;
  final Position position;
  MainLoaded({required this.distanceResponseDto,required this.position,});
}

 class MainError extends MainState {
  final String error;
  final Position position;


  MainError({required this.error,required this.position,});
}
