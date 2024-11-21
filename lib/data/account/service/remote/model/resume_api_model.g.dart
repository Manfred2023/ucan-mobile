// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResumeApiResponse _$ResumeApiResponseFromJson(Map<String, dynamic> json) =>
    ResumeApiResponse(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      response: json['response'] == null
          ? null
          : ResumeApiModel.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResumeApiResponseToJson(ResumeApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'response': instance.response,
    };

ResumeApiModel _$ResumeApiModelFromJson(Map<String, dynamic> json) =>
    ResumeApiModel(
      user: json['user'] == null
          ? null
          : UserApiModel.fromJson(json['user'] as Map<String, dynamic>),
      budget: (json['budget'] as List<dynamic>?)
          ?.map((e) => BudgetApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResumeApiModelToJson(ResumeApiModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'budget': instance.budget,
    };

BudgetApiModel _$BudgetApiModelFromJson(Map<String, dynamic> json) =>
    BudgetApiModel(
      token: (json['token'] as num?)?.toInt(),
      name: json['name'] as String?,
      ceiling: (json['ceiling'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BudgetApiModelToJson(BudgetApiModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'name': instance.name,
      'ceiling': instance.ceiling,
    };

UserApiModel _$UserApiModelFromJson(Map<String, dynamic> json) => UserApiModel(
      user: json['user'] as String?,
      amount: (json['amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserApiModelToJson(UserApiModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'amount': instance.amount,
    };
