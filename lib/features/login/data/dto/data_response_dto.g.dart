// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponseDto _$DataResponseDtoFromJson(Map<String, dynamic> json) =>
    DataResponseDto(
      refresh: json['refresh'] as String?,
      access: json['access'] as String?,
    );

Map<String, dynamic> _$DataResponseDtoToJson(DataResponseDto instance) =>
    <String, dynamic>{
      'refresh': instance.refresh,
      'access': instance.access,
    };
