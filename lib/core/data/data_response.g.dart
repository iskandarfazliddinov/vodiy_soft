// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponse<T> _$DataResponseFromJson<T>(Map<String, dynamic> json) =>
    DataResponse<T>(
      data: _Converter<T>().fromJson(json['data']),
    );

Map<String, dynamic> _$DataResponseToJson<T>(DataResponse<T> instance) =>
    <String, dynamic>{
      'data': _Converter<T>().toJson(instance.data),
    };
