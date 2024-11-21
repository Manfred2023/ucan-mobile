// Created by Manfred MOUKATE on 6/26/24, 11:50 AM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/26/24, 11:50 AM
import 'package:json_annotation/json_annotation.dart';
import 'package:ucan/data/account/service/remote/model/account_api_model.dart';

part 'paiement_api_model.g.dart';

@JsonSerializable()
class PaiementApiResponse {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "response")
  final PaiementApiModel? response;
  @JsonKey(name: "message")
  final String? message;

  PaiementApiResponse({
    this.status,
    this.type,
    this.response,
    this.message,
  });

  factory PaiementApiResponse.fromJson(Map<String, dynamic> json) =>
      _$PaiementApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaiementApiResponseToJson(this);
}

@JsonSerializable()
class PaiementApiListResponse {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "response")
  final List<PaiementApiModel>? response;
  @JsonKey(name: "message")
  final String? message;

  PaiementApiListResponse({
    this.status,
    this.type,
    this.response,
    this.message,
  });

  factory PaiementApiListResponse.fromJson(Map<String, dynamic> json) =>
      _$PaiementApiListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaiementApiListResponseToJson(this);
}

@JsonSerializable()
class PaiementApiModel {
  @JsonKey(name: "token")
  final int? token;
  @JsonKey(name: "type")
  final bool? type;
  @JsonKey(name: "datetime")
  final DateTime? datetime;
  @JsonKey(name: "amount")
  final int? amount;
  @JsonKey(name: "account")
  final AccountApiModel? account;
  @JsonKey(name: "motif")
  final String? motif;

  PaiementApiModel({
    this.token,
    this.type,
    this.datetime,
    this.amount,
    this.account,
    this.motif,
  });

  factory PaiementApiModel.fromJson(Map<String, dynamic> json) =>
      _$PaiementApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaiementApiModelToJson(this);
}
