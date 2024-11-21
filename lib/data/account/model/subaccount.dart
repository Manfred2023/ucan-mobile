// Created by Manfred MOUKATE on 11/6/24, 4:13 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 11/6/24, 4:13 PM
import 'package:equatable/equatable.dart';

class SubAccount extends Equatable {
  final int? code;
  final String? name;
  final int? amount;

  SubAccount({
    this.code,
    this.amount,
    this.name,
  });

  @override
  String toString() {
    return 'SubAccount{code: $code, amount: $amount,  }';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [code];
}
