import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/account.dart';
import '../../../model/subaccount.dart';

part 'account_api_model.g.dart';

AccountApiResponse accountApiResponseFromJson(String str) =>
    AccountApiResponse.fromJson(json.decode(str));

String accountApiResponseToJson(AccountApiResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class AccountApiResponse {
  final int status;
  final String type;
  final AccountApiModel response;

  AccountApiResponse({
    required this.status,
    required this.type,
    required this.response,
  });

  factory AccountApiResponse.fromJson(Map<String, dynamic> json) =>
      AccountApiResponse(
        status: json["status"],
        type: json["type"],
        response: AccountApiModel.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "type": type,
        "response": response.toJson(),
      };
}

@JsonSerializable()
class AccountApiModel {
  final int token;
  final String user;
  final int amount;
  final List<SubAccountApiModel> other;

  AccountApiModel({
    required this.token,
    required this.user,
    required this.amount,
    required this.other,
  });

  factory AccountApiModel.fromJson(Map<String, dynamic> json) =>
      AccountApiModel(
        token: json["token"],
        user: json["user"],
        amount: json["amount"],
        other: List<SubAccountApiModel>.from(
            json["other"].map((x) => SubAccountApiModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user,
        "amount": amount,
        "other": List<dynamic>.from(other.map((x) => x.toJson())),
      };

  Account toAccount() {
    return Account(
      code: token,
      amount: amount,
      user: user,
      subAccount: other.map((e) => e.toSubAccount()).toList(),
    );
  }
}

@JsonSerializable()
class SubAccountApiModel {
  final int token;
  final int amount;
  final String name;

  SubAccountApiModel({
    required this.token,
    required this.amount,
    required this.name,
  });

  factory SubAccountApiModel.fromJson(Map<String, dynamic> json) =>
      SubAccountApiModel(
        token: json["token"],
        amount: json["amount"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "amount": amount,
        "name": name,
      };

  SubAccount toSubAccount() {
    return SubAccount(code: token, amount: amount, name: name);
  }
}
