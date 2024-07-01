// Created by Manfred MOUKATE on 6/28/24, 3:48 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/28/24, 3:48 PM

import 'package:json_annotation/json_annotation.dart';

part 'convert_api_model.g.dart';

@JsonSerializable()
class ConvertApiResponse {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "message")
  final String? message;

  ConvertApiResponse({
    this.status,
    this.type,
    this.message,
  });

  factory ConvertApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ConvertApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConvertApiResponseToJson(this);
}
