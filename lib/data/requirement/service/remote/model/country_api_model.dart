// Created by Manfred MOUKATE on 6/21/24, 5:07 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/21/24, 5:07 PM
import 'package:json_annotation/json_annotation.dart';
import 'package:ucan/data/authentication/model/authentication.dart';

part 'country_api_model.g.dart';

@JsonSerializable()
class CountryApiResponse {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "response")
  final List<CountryApiModel>? response;
  @JsonKey(name: "message")
  final String? message;

  CountryApiResponse({
    this.status,
    this.type,
    this.response,
    this.message,
  });

  factory CountryApiResponse.fromJson(Map<String, dynamic> json) =>
      _$CountryApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountryApiResponseToJson(this);
}

@JsonSerializable()
class CountryApiModel {
  @JsonKey(name: "token")
  final int? token;
  @JsonKey(name: "namefr")
  final String? namefr;
  @JsonKey(name: "nameen")
  final String? nameen;
  @JsonKey(name: "alpha1")
  final String? alpha1;
  @JsonKey(name: "alpha2")
  final String? alpha2;
  @JsonKey(name: "dialcode")
  final int? dialcode;

  CountryApiModel({
    this.token,
    this.namefr,
    this.nameen,
    this.alpha1,
    this.alpha2,
    this.dialcode,
  });

  factory CountryApiModel.fromJson(Map<String, dynamic> json) =>
      _$CountryApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryApiModelToJson(this);

  Country toCountry() {
    return Country(
        code: token!,
        nameen: nameen!,
        namefr: namefr!,
        alpha1: alpha1!,
        alpha2: alpha2!,
        dialcode: dialcode!);
  }
}
