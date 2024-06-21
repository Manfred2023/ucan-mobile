// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactApiResponse _$ContactApiResponseFromJson(Map<String, dynamic> json) =>
    ContactApiResponse(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      response: json['response'] == null
          ? null
          : ContactApiModel.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactApiResponseToJson(ContactApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'response': instance.response,
    };

ContactApiModel _$ContactApiModelFromJson(Map<String, dynamic> json) =>
    ContactApiModel(
      token: (json['token'] as num?)?.toInt(),
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      gender: json['gender'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      location: json['location'] as String?,
      city: json['city'] == null
          ? null
          : CityApiModel.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactApiModelToJson(ContactApiModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'gender': instance.gender,
      'mobile': instance.mobile,
      'email': instance.email,
      'location': instance.location,
      'city': instance.city,
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
