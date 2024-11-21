// Created by Manfred MOUKATE on 6/25/24, 3:49 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/25/24, 3:49 PM
import 'package:equatable/equatable.dart';
import 'package:ucan/data/account/model/subaccount.dart';

import 'budget.dart';

class Account extends Equatable {
  final int? code;
  final int? amount;
  final String? user;
  final List<SubAccount>? subAccount;

  const Account({
    this.code,
    this.amount,
    this.user,
    this.subAccount,
  });

  @override
  String toString() {
    return 'Account{code: $code, amount: $amount, user: $user, other: $subAccount}';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [user, code];
}

class Resume extends Equatable {
  final UserAbstract? user;
  final List<Budget>? budget;

  Resume({
    this.user,
    this.budget,
  });

  @override
  String toString() {
    return 'Resume{user: $user, budget: $budget}';
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class UserAbstract {
  final String? user;
  final int? amount;

  UserAbstract({
    this.user,
    this.amount,
  });

  @override
  String toString() {
    return 'UserAbstract{user: $user, amount: $amount}';
  }
}
