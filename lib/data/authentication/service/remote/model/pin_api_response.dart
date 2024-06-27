// Created by Manfred MOUKATE on 6/27/24, 3:32 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/27/24, 3:32 PM
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/authentication.dart';

part 'pin_api_response.g.dart';

@JsonSerializable()
class PinApiResponse {
  final int status;
  final String type;
  final String response;
  static const example = PinApiResponse(status: 1, type: "ok", response: "ok");

  const PinApiResponse(
      {required this.status, required this.type, required this.response});

  Map<String, dynamic> toJson() => _$PinApiResponseToJson(this);

  factory PinApiResponse.fromJson(Map<String, dynamic> json) =>
      _$PinApiResponseFromJson(json);

  Pin toPin() {
    return Pin(
      status: status,
      type: type,
      response: response,
    );
  }

  @override
  String toString() {
    return 'PinApiResponse{status: $status, type: $type, response: $response}';
  }
}
