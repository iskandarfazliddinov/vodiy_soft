import 'package:json_annotation/json_annotation.dart';

part 'default_response.g.dart';

@JsonSerializable()
class DefaultResponse<T> {
  @JsonKey(name: "data")
  @_Converter()
  final List<T> data;

  const DefaultResponse({
    required this.data,
  });

  factory DefaultResponse.fromJson(Map<String, dynamic> json) =>
      _$DefaultResponseFromJson<T>(json);

  Map<String, dynamic> toJson() => _$DefaultResponseToJson(this);
}

class _Converter<T> implements JsonConverter<T, Object?> {
  const _Converter();

  @override
  T fromJson(Object? json) {
    if (json is Map<String, dynamic>) {
      switch (T) {
        // case StatusDto:
        //   return StatusDto.fromJson(json) as T;
        // case TaskResponseDto:
        //   return TaskResponseDto.fromJson(json) as T;
        // case NotificationResponseAllDto:
        //   return NotificationResponseAllDto.fromJson(json) as T;
        // case WorkTableDto:
        //     return WorkTableDto.fromJson(json) as T;
      }
      return DefaultResponse<T>.fromJson(json) as T;
    }
    return json as T;
  }

  @override
  Object? toJson(T object) => object;
}
