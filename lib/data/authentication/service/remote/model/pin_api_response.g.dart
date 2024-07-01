// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PinApiResponse _$PinApiResponseFromJson(Map<String, dynamic> json) =>
    PinApiResponse(
      status: (json['status'] as num).toInt(),
      type: json['type'] as String,
      response: json['response'] as String,
    );

Map<String, dynamic> _$PinApiResponseToJson(PinApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'response': instance.response,
    };
