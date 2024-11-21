// Created by Manfred MOUKATE on 11/21/24, 5:22 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 11/21/24, 5:22 PM
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ucan/data/account/model/paiement.dart';
import 'package:ucan/data/account/model/spent.dart';

part 'spent_api_model.g.dart';

@JsonSerializable()
class SpentApiResponse {
  final int? status;
  final String? type;
  final SpentApiModel? response;

  SpentApiResponse({
    this.status,
    this.type,
    this.response,
  });
  factory SpentApiResponse.fromJson(Map<String, dynamic> json) =>
      _$SpentApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SpentApiResponseToJson(this);

  @override
  String toString() {
    return 'SpentApiResponse{status: $status, type: $type, response: $response}';
  }
}

@JsonSerializable()
class SpentApiModel {
  final int? total;
  final List<PaiementApiModel>? paiements;

  SpentApiModel({
    this.total,
    this.paiements,
  });
  factory SpentApiModel.fromJson(Map<String, dynamic> json) =>
      _$SpentApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpentApiModelToJson(this);

  @override
  String toString() {
    return 'SpentApiModel{total: $total, paiements: $paiements}';
  }

  Spent toSpent() {
    return Spent(
        total: total,
        paiements:
            paiements?.map((toElement) => toElement.toPaiement()).toList());
  }
}

@JsonSerializable()
class PaiementApiModel {
  final int? token;
  final int? amount;
  final String? budget;
  final DateTime? date;

  PaiementApiModel({
    this.token,
    this.amount,
    this.budget,
    this.date,
  });
  factory PaiementApiModel.fromJson(Map<String, dynamic> json) =>
      _$PaiementApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaiementApiModelToJson(this);

  @override
  String toString() {
    return 'PaiementApiModel{token: $token, amount: $amount, budget: $budget, date: $date}';
  }

  Paiement toPaiement() {
    return Paiement(token: token, amount: amount, budget: budget, date: date);
  }
}
