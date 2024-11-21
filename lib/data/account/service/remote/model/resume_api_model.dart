import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ucan/data/account/model/account.dart';

import '../../../model/budget.dart';

part 'resume_api_model.g.dart';

@JsonSerializable()
class ResumeApiResponse {
  final int? status;
  final String? type;
  final ResumeApiModel? response;

  ResumeApiResponse({
    this.status,
    this.type,
    this.response,
  });
  factory ResumeApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ResumeApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResumeApiResponseToJson(this);

  @override
  String toString() {
    return 'ResumeApiResponse{status: $status, type: $type, response: $response}';
  }
}

@JsonSerializable()
class ResumeApiModel {
  final UserApiModel? user;
  final List<BudgetApiModel>? budget;

  ResumeApiModel({
    this.user,
    this.budget,
  });
  factory ResumeApiModel.fromJson(Map<String, dynamic> json) =>
      _$ResumeApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResumeApiModelToJson(this);

  @override
  String toString() {
    return 'ResumeApiModel{user: $user, budget: $budget}';
  }

  Resume toResume() {
    return Resume(
      user: user?.toUserAbstract(),
      budget: budget?.map((toElement) => toElement.toBudget()).toList(),
    );
  }
}

@JsonSerializable()
class BudgetApiModel {
  final int? token;
  final String? name;
  final int? ceiling;

  BudgetApiModel({
    this.token,
    this.name,
    this.ceiling,
  });
  factory BudgetApiModel.fromJson(Map<String, dynamic> json) =>
      _$BudgetApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$BudgetApiModelToJson(this);

  @override
  String toString() {
    return 'BudgetApiModel{token: $token, name: $name, ceiling: $ceiling}';
  }

  Budget toBudget() {
    return Budget(code: token, name: name, ceiling: ceiling);
  }
}

@JsonSerializable()
class UserApiModel {
  final String? user;
  final int? amount;

  UserApiModel({
    this.user,
    this.amount,
  });

  factory UserApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserApiModelToJson(this);

  @override
  String toString() {
    return 'UserApiModel{user: $user, amount: $amount}';
  }

  UserAbstract toUserAbstract() {
    return UserAbstract(user: user, amount: amount);
  }
}
