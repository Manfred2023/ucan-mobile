// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityApiResponse _$CityApiResponseFromJson(Map<String, dynamic> json) =>
    CityApiResponse(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      response: (json['response'] as List<dynamic>?)
          ?.map((e) => CityApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CityApiResponseToJson(CityApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'response': instance.response,
    };

CityApiModel _$CityApiModelFromJson(Map<String, dynamic> json) => CityApiModel(
      token: (json['token'] as num?)?.toInt(),
      name: json['name'] as String?,
      country: json['country'] == null
          ? null
          : CountryApiModel.fromJson(json['country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CityApiModelToJson(CityApiModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'name': instance.name,
      'country': instance.country,
    };
