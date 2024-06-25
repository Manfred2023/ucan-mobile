// Created by Manfred MOUKATE on 6/25/24, 3:49 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/25/24, 3:49 PM
import 'package:equatable/equatable.dart';

class Account extends Equatable {
  final int? code;
  final int? amount;
  final int? user;

  Account({
    this.code,
    this.amount,
    this.user,
  });

  @override
  String toString() {
    return 'AccountApiModel{code: $code, amount: $amount, user: $user}';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [user, code];
}
