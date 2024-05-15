import 'package:json_annotation/json_annotation.dart';

part 'data_response_dto.g.dart';

@JsonSerializable()
class DataResponseDto {
  final String? refresh;
  final String? access;

  DataResponseDto({
    required this.refresh,
    required this.access,
  });

  factory DataResponseDto.fromJson(Map<String,dynamic> json) => _$DataResponseDtoFromJson(json);

  Map<String, dynamic> toJson() =>_$DataResponseDtoToJson(this);
}