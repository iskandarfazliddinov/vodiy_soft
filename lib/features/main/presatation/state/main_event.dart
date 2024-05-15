part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class MainRequestEvent extends MainEvent{
  final DistanceRequestDto distanceRequestDto;

  MainRequestEvent({required this.distanceRequestDto});
}
