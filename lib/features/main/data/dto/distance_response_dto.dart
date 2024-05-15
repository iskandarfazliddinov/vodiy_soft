import 'dart:ffi';
import 'package:json_annotation/json_annotation.dart';

part 'distance_response_dto.g.dart';

@JsonSerializable()
class DistanceResponseDto {
  final double? message;
  final int? status;

  DistanceResponseDto({
    required this.message,
    required this.status,
  });

  factory DistanceResponseDto.fromJson(Map<String,dynamic> json) => _$DistanceResponseDtoFromJson(json);

  Map<String, dynamic> toJson() =>_$DistanceResponseDtoToJson(this);
}