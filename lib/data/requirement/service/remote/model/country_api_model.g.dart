// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryApiResponse _$CountryApiResponseFromJson(Map<String, dynamic> json) =>
    CountryApiResponse(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      response: (json['response'] as List<dynamic>?)
          ?.map((e) => CountryApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CountryApiResponseToJson(CountryApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'response': instance.response,
      'message': instance.message,
    };

CountryApiModel _$CountryApiModelFromJson(Map<String, dynamic> json) =>
    CountryApiModel(
      token: (json['token'] as num?)?.toInt(),
      namefr: json['namefr'] as String?,
      nameen: json['nameen'] as String?,
      alpha1: json['alpha1'] as String?,
      alpha2: json['alpha2'] as String?,
      dialcode: (json['dialcode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CountryApiModelToJson(CountryApiModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'namefr': instance.namefr,
      'nameen': instance.nameen,
      'alpha1': instance.alpha1,
      'alpha2': instance.alpha2,
      'dialcode': instance.dialcode,
    };
