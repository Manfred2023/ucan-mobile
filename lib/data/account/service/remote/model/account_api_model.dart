// Created by Manfred MOUKATE on 6/25/24, 3:50 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/25/24, 3:50 PM
import 'package:json_annotation/json_annotation.dart';
import 'package:ucan/data/account/model/account.dart';

part 'account_api_model.g.dart';

@JsonSerializable()
class AccountApiResponse {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "response")
  final AccountApiModel? response;

  AccountApiResponse({
    this.status,
    this.type,
    this.response,
  });

  factory AccountApiResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AccountApiResponseToJson(this);
}

@JsonSerializable()
class AccountApiModel {
  @JsonKey(name: "token")
  final int? token;
  @JsonKey(name: "amount")
  final int? amount;
  @JsonKey(name: "user")
  final int? user;

  AccountApiModel({
    this.token,
    this.amount,
    this.user,
  });

  factory AccountApiModel.fromJson(Map<String, dynamic> json) =>
      _$AccountApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountApiModelToJson(this);

  Account toAccount() {
    return Account(
      code: token,
      amount: amount,
      user: user,
    );
  }
}
