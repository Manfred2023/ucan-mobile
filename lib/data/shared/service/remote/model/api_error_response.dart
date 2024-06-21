import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_response.g.dart';

@JsonSerializable()
class ApiErrorResponse {
  final int? status;
  final String? message;
  final String? response;
  final String? type;

  const ApiErrorResponse({
    this.message,
    this.status,
    this.response,
    this.type,
  });

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorResponseFromJson(json);
}
