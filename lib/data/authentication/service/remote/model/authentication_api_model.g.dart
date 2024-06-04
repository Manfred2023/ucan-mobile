// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoyaltyHistoryApiResponse _$LoyaltyHistoryFromJson(Map<String, dynamic> json) =>
    LoyaltyHistoryApiResponse(
      userCredential: json['UserCredential'] == null
          ? null
          : UserCredentialApiModel.fromJson(
              json['UserCredential'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoyaltyHistoryToJson(
        LoyaltyHistoryApiResponse instance) =>
    <String, dynamic>{
      'UserCredential': instance.userCredential,
    };

UserCredentialApiModel _$UserCredentialFromJson(Map<String, dynamic> json) =>
    UserCredentialApiModel(
      additionalUserInfo: json['additionalUserInfo'] == null
          ? null
          : AdditionalUserInfo.fromJson(
              json['additionalUserInfo'] as Map<String, dynamic>),
      credential: json['credential'],
      user: json['user'] == null
          ? null
          : UserApiModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserCredentialToJson(UserCredentialApiModel instance) =>
    <String, dynamic>{
      'additionalUserInfo': instance.additionalUserInfo,
      'credential': instance.credential,
      'user': instance.user,
    };

AdditionalUserInfo _$AdditionalUserInfoFromJson(Map<String, dynamic> json) =>
    AdditionalUserInfo(
      isNewUser: json['isNewUser'] as bool?,
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      providerId: json['providerId'],
      username: json['username'],
      authorizationCode: json['authorizationCode'],
    );

Map<String, dynamic> _$AdditionalUserInfoToJson(AdditionalUserInfo instance) =>
    <String, dynamic>{
      'isNewUser': instance.isNewUser,
      'profile': instance.profile,
      'providerId': instance.providerId,
      'username': instance.username,
      'authorizationCode': instance.authorizationCode,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile();

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{};

UserApiModel _$UserFromJson(Map<String, dynamic> json) => UserApiModel(
      displayName: json['displayName'],
      email: json['email'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool?,
      isAnonymous: json['isAnonymous'] as bool?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      phoneNumber: json['phoneNumber'],
      photoUrl: json['photoURL'],
      providerData: (json['providerData'] as List<dynamic>?)
          ?.map((e) => ProviderDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      refreshToken: json['refreshToken'],
      tenantId: json['tenantId'],
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$UserToJson(UserApiModel instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'isEmailVerified': instance.isEmailVerified,
      'isAnonymous': instance.isAnonymous,
      'metadata': instance.metadata,
      'phoneNumber': instance.phoneNumber,
      'photoURL': instance.photoUrl,
      'providerData': instance.providerData,
      'refreshToken': instance.refreshToken,
      'tenantId': instance.tenantId,
      'uid': instance.uid,
    };

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
      creationTime: json['creationTime'] == null
          ? null
          : DateTime.parse(json['creationTime'] as String),
      lastSignInTime: json['lastSignInTime'] == null
          ? null
          : DateTime.parse(json['lastSignInTime'] as String),
    );

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
      'creationTime': instance.creationTime?.toIso8601String(),
      'lastSignInTime': instance.lastSignInTime?.toIso8601String(),
    };

ProviderDatum _$ProviderDatumFromJson(Map<String, dynamic> json) =>
    ProviderDatum(
      displayName: json['displayName'],
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'],
      photoUrl: json['photoURL'],
      providerId: json['providerId'] as String?,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$ProviderDatumToJson(ProviderDatum instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'photoURL': instance.photoUrl,
      'providerId': instance.providerId,
      'uid': instance.uid,
    };
