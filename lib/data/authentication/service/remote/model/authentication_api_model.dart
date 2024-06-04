import 'package:json_annotation/json_annotation.dart';
import 'package:ucan/data/authentication/model/user.dart';

part 'authentication_api_model.g.dart';

@JsonSerializable()
class LoyaltyHistoryApiResponse {
  @JsonKey(name: "UserCredential")
  UserCredentialApiModel? userCredential;
  LoyaltyHistoryApiResponse({
    this.userCredential,
  });

  factory LoyaltyHistoryApiResponse.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$LoyaltyHistoryToJson(this);
}

@JsonSerializable()
class UserCredentialApiModel {
  @JsonKey(name: "additionalUserInfo")
  AdditionalUserInfo? additionalUserInfo;
  @JsonKey(name: "credential")
  dynamic credential;
  @JsonKey(name: "user")
  UserApiModel? user;

  UserCredentialApiModel({
    this.additionalUserInfo,
    this.credential,
    this.user,
  });

  factory UserCredentialApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserCredentialFromJson(json);

  Map<String, dynamic> toJson() => _$UserCredentialToJson(this);
}

@JsonSerializable()
class AdditionalUserInfo {
  @JsonKey(name: "isNewUser")
  bool? isNewUser;
  @JsonKey(name: "profile")
  Profile? profile;
  @JsonKey(name: "providerId")
  dynamic providerId;
  @JsonKey(name: "username")
  dynamic username;
  @JsonKey(name: "authorizationCode")
  dynamic authorizationCode;

  AdditionalUserInfo({
    this.isNewUser,
    this.profile,
    this.providerId,
    this.username,
    this.authorizationCode,
  });

  factory AdditionalUserInfo.fromJson(Map<String, dynamic> json) =>
      _$AdditionalUserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalUserInfoToJson(this);
}

@JsonSerializable()
class Profile {
  Profile();

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

@JsonSerializable()
class UserApiModel {
  @JsonKey(name: "displayName")
  dynamic displayName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "isEmailVerified")
  bool? isEmailVerified;
  @JsonKey(name: "isAnonymous")
  bool? isAnonymous;
  @JsonKey(name: "metadata")
  Metadata? metadata;
  @JsonKey(name: "phoneNumber")
  dynamic phoneNumber;
  @JsonKey(name: "photoURL")
  dynamic photoUrl;
  @JsonKey(name: "providerData")
  List<ProviderDatum>? providerData;
  @JsonKey(name: "refreshToken")
  dynamic refreshToken;
  @JsonKey(name: "tenantId")
  dynamic tenantId;
  @JsonKey(name: "uid")
  String? uid;

  UserApiModel({
    this.displayName,
    this.email,
    this.isEmailVerified,
    this.isAnonymous,
    this.metadata,
    this.phoneNumber,
    this.photoUrl,
    this.providerData,
    this.refreshToken,
    this.tenantId,
    this.uid,
  });

  factory UserApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User toUser() {
    return User(email: email ?? '');
  }
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "creationTime")
  DateTime? creationTime;
  @JsonKey(name: "lastSignInTime")
  DateTime? lastSignInTime;

  Metadata({
    this.creationTime,
    this.lastSignInTime,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class ProviderDatum {
  @JsonKey(name: "displayName")
  dynamic displayName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phoneNumber")
  dynamic phoneNumber;
  @JsonKey(name: "photoURL")
  dynamic photoUrl;
  @JsonKey(name: "providerId")
  String? providerId;
  @JsonKey(name: "uid")
  String? uid;

  ProviderDatum({
    this.displayName,
    this.email,
    this.phoneNumber,
    this.photoUrl,
    this.providerId,
    this.uid,
  });

  factory ProviderDatum.fromJson(Map<String, dynamic> json) =>
      _$ProviderDatumFromJson(json);

  Map<String, dynamic> toJson() => _$ProviderDatumToJson(this);
}
