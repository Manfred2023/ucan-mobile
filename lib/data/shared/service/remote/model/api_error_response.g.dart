// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorResponse _$ApiErrorResponseFromJson(Map<String, dynamic> json) =>
    ApiErrorResponse(
      message: json['message'] as String?,
      status: (json['status'] as num?)?.toInt(),
      response: json['response'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ApiErrorResponseToJson(ApiErrorResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'response': instance.response,
      'type': instance.type,
    };
