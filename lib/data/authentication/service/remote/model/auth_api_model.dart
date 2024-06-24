// Created by Manfred MOUKATE on 6/21/24, 8:03 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/21/24, 8:03 PM

import 'package:json_annotation/json_annotation.dart';
import 'package:ucan/data/authentication/model/authentication.dart';

import 'contact_api_model.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiResponse {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "response")
  final AuthApiModel? response;
  @JsonKey(name: "message")
  final String? message;

  AuthApiResponse(
    this.message, {
    this.status,
    this.type,
    this.response,
  });

  factory AuthApiResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiResponseToJson(this);
}

@JsonSerializable()
class AuthApiModel {
  @JsonKey(name: "token")
  final int? token;
  @JsonKey(name: "pin")
  final int? pin;
  @JsonKey(name: "contact")
  final ContactApiModel? contact;

  AuthApiModel({
    this.token,
    this.pin,
    this.contact,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  @override
  String toString() {
    return 'AuthApiModel{token: $token, pin: $pin, contact: $contact}';
  }

  Authentication toAuth() {
    return Authentication(
      token: token.toString(),
      pin: pin.toString(),
      contact: contact!.toContact(),
    );
  }
}
