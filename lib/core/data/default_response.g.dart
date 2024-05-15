// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DefaultResponse<T> _$DefaultResponseFromJson<T>(Map<String, dynamic> json) =>
    DefaultResponse<T>(
      data: (json['data'] as List<dynamic>)
          .map(_Converter<T>().fromJson)
          .toList(),
    );

Map<String, dynamic> _$DefaultResponseToJson<T>(DefaultResponse<T> instance) =>
    <String, dynamic>{
      'data': instance.data.map(_Converter<T>().toJson).toList(),
    };
