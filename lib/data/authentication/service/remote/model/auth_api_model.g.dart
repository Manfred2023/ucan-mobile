// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthApiResponse _$AuthApiResponseFromJson(Map<String, dynamic> json) =>
    AuthApiResponse(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      response: json['response'] == null
          ? null
          : AuthApiModel.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthApiResponseToJson(AuthApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'response': instance.response,
    };

AuthApiModel _$AuthApiModelFromJson(Map<String, dynamic> json) => AuthApiModel(
      token: (json['token'] as num?)?.toInt(),
      pin: json['pin'] as String?,
      code: json['code'] as String?,
      contact: json['contact'] == null
          ? null
          : ContactApiModel.fromJson(json['contact'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthApiModelToJson(AuthApiModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'pin': instance.pin,
      'code': instance.code,
      'contact': instance.contact,
    };
