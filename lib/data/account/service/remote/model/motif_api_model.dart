// Created by Manfred MOUKATE on 6/25/24, 8:17 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/25/24, 8:17 PM
import 'package:json_annotation/json_annotation.dart';
import 'package:ucan/data/account/model/motif.dart';

part 'motif_api_model.g.dart';

@JsonSerializable()
class MotifApiListResponse {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "response")
  final List<MotifApiModel>? response;

  MotifApiListResponse({
    this.status,
    this.type,
    this.response,
  });

  factory MotifApiListResponse.fromJson(Map<String, dynamic> json) =>
      _$MotifApiListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MotifApiListResponseToJson(this);
}

@JsonSerializable()
class MotifApiResponse {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "response")
  final MotifApiModel? response;

  MotifApiResponse({
    this.status,
    this.type,
    this.response,
  });

  factory MotifApiResponse.fromJson(Map<String, dynamic> json) =>
      _$MotifApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MotifApiResponseToJson(this);
}

@JsonSerializable()
class MotifApiModel {
  @JsonKey(name: "token")
  final int? token;
  @JsonKey(name: "name")
  final String? name;

  MotifApiModel({
    this.token,
    this.name,
  });

  factory MotifApiModel.fromJson(Map<String, dynamic> json) =>
      _$MotifApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$MotifApiModelToJson(this);

  Motif toMotif() {
    return Motif(code: token, name: name);
  }
}
