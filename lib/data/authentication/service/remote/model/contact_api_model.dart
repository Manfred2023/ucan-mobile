// Created by Manfred MOUKATE on 6/21/24, 8:03 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/21/24, 8:03 PM
import 'package:json_annotation/json_annotation.dart';
import 'package:ucan/data/authentication/model/authentication.dart';

part 'contact_api_model.g.dart';

@JsonSerializable()
class ContactApiResponse {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "response")
  final ContactApiModel? response;

  ContactApiResponse({
    this.status,
    this.type,
    this.response,
  });

  factory ContactApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContactApiResponseToJson(this);
}

@JsonSerializable()
class ContactApiModel {
  @JsonKey(name: "token")
  final int? token;
  @JsonKey(name: "firstname")
  final String? firstname;
  @JsonKey(name: "lastname")
  final String? lastname;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "mobile")
  final String? mobile;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "location")
  final String? location;
  @JsonKey(name: "city")
  final CityApiModel? city;

  ContactApiModel({
    this.token,
    this.firstname,
    this.lastname,
    this.gender,
    this.mobile,
    this.email,
    this.location,
    this.city,
  });

  factory ContactApiModel.fromJson(Map<String, dynamic> json) =>
      _$ContactApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactApiModelToJson(this);
  Contact toContact() {
    return Contact(
        location: location,
        code: token,
        gender: gender,
        lastname: lastname,
        firstname: firstname,
        mobile: mobile,
        email: email,
        city: city!.toCity());
  }
}

@JsonSerializable()
class CityApiModel {
  @JsonKey(name: "token")
  final int? token;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "country")
  final CountryApiModel? country;

  CityApiModel({
    this.token,
    this.name,
    this.country,
  });

  factory CityApiModel.fromJson(Map<String, dynamic> json) =>
      _$CityApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityApiModelToJson(this);

  City toCity() {
    return City(
        name: name!, code: token.toString(), country: country!.toCountry());
  }
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
        dialcode: dialcode);
  }
}
