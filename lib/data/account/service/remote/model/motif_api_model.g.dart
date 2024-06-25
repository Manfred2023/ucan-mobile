// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motif_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MotifApiListResponse _$MotifApiListResponseFromJson(
        Map<String, dynamic> json) =>
    MotifApiListResponse(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      response: (json['response'] as List<dynamic>?)
          ?.map((e) => MotifApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MotifApiListResponseToJson(
        MotifApiListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'response': instance.response,
    };

MotifApiResponse _$MotifApiResponseFromJson(Map<String, dynamic> json) =>
    MotifApiResponse(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      response: json['response'] == null
          ? null
          : MotifApiModel.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MotifApiResponseToJson(MotifApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'response': instance.response,
    };

MotifApiModel _$MotifApiModelFromJson(Map<String, dynamic> json) =>
    MotifApiModel(
      token: (json['token'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$MotifApiModelToJson(MotifApiModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'name': instance.name,
    };
