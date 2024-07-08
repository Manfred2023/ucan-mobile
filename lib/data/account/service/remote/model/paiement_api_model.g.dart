// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paiement_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaiementApiResponse _$PaiementApiResponseFromJson(Map<String, dynamic> json) =>
    PaiementApiResponse(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      response: json['response'] == null
          ? null
          : PaiementApiModel.fromJson(json['response'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PaiementApiResponseToJson(
        PaiementApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'response': instance.response,
      'message': instance.message,
    };

PaiementApiListResponse _$PaiementApiListResponseFromJson(
        Map<String, dynamic> json) =>
    PaiementApiListResponse(
      status: (json['status'] as num?)?.toInt(),
      type: json['type'] as String?,
      response: (json['response'] as List<dynamic>?)
          ?.map((e) => PaiementApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PaiementApiListResponseToJson(
        PaiementApiListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'type': instance.type,
      'response': instance.response,
      'message': instance.message,
    };

PaiementApiModel _$PaiementApiModelFromJson(Map<String, dynamic> json) =>
    PaiementApiModel(
      token: (json['token'] as num?)?.toInt(),
      type: json['type'] as bool?,
      datetime: json['datetime'] == null
          ? null
          : DateTime.parse(json['datetime'] as String),
      amount: (json['amount'] as num?)?.toInt(),
      account: json['account'] == null
          ? null
          : AccountApiModel.fromJson(json['account'] as Map<String, dynamic>),
      motif: json['motif'] as String?,
    );

Map<String, dynamic> _$PaiementApiModelToJson(PaiementApiModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'type': instance.type,
      'datetime': instance.datetime?.toIso8601String(),
      'amount': instance.amount,
      'account': instance.account,
      'motif': instance.motif,
    };
