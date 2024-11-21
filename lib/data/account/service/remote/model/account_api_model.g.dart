// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountApiResponse _$AccountApiResponseFromJson(Map<String, dynamic> json) =>
    AccountApiResponse(
      status: (json['status'] as num).toInt(),
      type: json['type'] as String,
      response:
          AccountApiModel.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountApiResponseToJson(AccountApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'response': instance.response,
    };

AccountApiModel _$AccountApiModelFromJson(Map<String, dynamic> json) =>
    AccountApiModel(
      token: (json['token'] as num).toInt(),
      user: json['user'] as String,
      amount: (json['amount'] as num).toInt(),
      other: (json['other'] as List<dynamic>)
          .map((e) => SubAccountApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountApiModelToJson(AccountApiModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
      'amount': instance.amount,
      'other': instance.other,
    };

SubAccountApiModel _$SubAccountApiModelFromJson(Map<String, dynamic> json) =>
    SubAccountApiModel(
      token: (json['token'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$SubAccountApiModelToJson(SubAccountApiModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'amount': instance.amount,
      'name': instance.name,
    };
