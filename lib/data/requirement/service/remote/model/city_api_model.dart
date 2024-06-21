import 'package:json_annotation/json_annotation.dart';
import 'package:ucan/data/authentication/model/authentication.dart';

import 'country_api_model.dart';

part 'city_api_model.g.dart';

@JsonSerializable()
class CityApiResponse {
  @JsonKey(name: "status")
  final int? status;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "response")
  final List<CityApiModel>? response;

  CityApiResponse({
    this.status,
    this.type,
    this.response,
  });

  factory CityApiResponse.fromJson(Map<String, dynamic> json) =>
      _$CityApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CityApiResponseToJson(this);
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

class DecoderErrorSearchApiModel {
  final String? subscriber;
  final String? decoder;

  const DecoderErrorSearchApiModel(
      {required this.subscriber, required this.decoder});

  @override
  String toString() {
    return 'DecoderErrorSearchApiModel{subscriber: $subscriber, decoder: $decoder}';
  }
}
