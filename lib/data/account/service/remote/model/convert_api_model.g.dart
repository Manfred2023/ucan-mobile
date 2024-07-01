// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'convert_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConvertApiResponse _$ConvertApiResponseFromJson(Map<String, dynamic> json) =>
    ConvertApiResponse(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ConvertApiResponseToJson(ConvertApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'message': instance.message,
    };
