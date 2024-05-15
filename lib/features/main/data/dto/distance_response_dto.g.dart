// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distance_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistanceResponseDto _$DistanceResponseDtoFromJson(Map<String, dynamic> json) =>
    DistanceResponseDto(
      message: json['message'] as double?,
      status: (json['status'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DistanceResponseDtoToJson(
        DistanceResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
