import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';

part 'distance_request_dto.g.dart';

@JsonSerializable()
class DistanceRequestDto {
  final String? latitude;
  final String? longitude;

  DistanceRequestDto({
    required this.latitude,
    required this.longitude,
  });

  factory DistanceRequestDto.fromJson(Map<String,dynamic> json) => _$DistanceRequestDtoFromJson(json);

  Map<String, dynamic> toJson() =>_$DistanceRequestDtoToJson(this);
}