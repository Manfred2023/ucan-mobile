// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spent_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpentApiResponse _$SpentApiResponseFromJson(Map<String, dynamic> json) =>
    SpentApiResponse(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      response: json['response'] == null
          ? null
          : SpentApiModel.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpentApiResponseToJson(SpentApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'response': instance.response,
    };

SpentApiModel _$SpentApiModelFromJson(Map<String, dynamic> json) =>
    SpentApiModel(
      total: (json['total'] as num?)?.toInt(),
      paiements: (json['paiements'] as List<dynamic>?)
          ?.map((e) => PaiementApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpentApiModelToJson(SpentApiModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'paiements': instance.paiements,
    };

PaiementApiModel _$PaiementApiModelFromJson(Map<String, dynamic> json) =>
    PaiementApiModel(
      token: (json['token'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toInt(),
      budget: json['budget'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$PaiementApiModelToJson(PaiementApiModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'amount': instance.amount,
      'budget': instance.budget,
      'date': instance.date?.toIso8601String(),
    };
