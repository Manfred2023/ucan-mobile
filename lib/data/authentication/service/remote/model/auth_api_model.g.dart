// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthApiResponse _$AuthApiResponseFromJson(Map<String, dynamic> json) =>
    AuthApiResponse(
      json['message'] as String?,
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
      'message': instance.message,
    };

AuthApiModel _$AuthApiModelFromJson(Map<String, dynamic> json) => AuthApiModel(
      token: (json['token'] as num?)?.toInt(),
      pin: (json['pin'] as num?)?.toInt(),
      contact: json['contact'] == null
          ? null
          : ContactApiModel.fromJson(json['contact'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthApiModelToJson(AuthApiModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'pin': instance.pin,
      'contact': instance.contact,
    };
