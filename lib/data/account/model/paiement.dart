// Created by Manfred MOUKATE on 6/26/24, 11:47 AM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/26/24, 11:47 AM

import 'package:equatable/equatable.dart';
import 'package:ucan/data/account/model/account.dart';
import 'package:ucan/data/account/model/motif.dart';

class Paiement extends Equatable {
  final int? code;
  final bool? type;
  final DateTime? date;
  final int? amount;
  final Motif? motif;
  final Account? account;

  Paiement(
      {this.code, this.type, this.date, this.amount, this.motif, this.account});

  @override
  String toString() {
    return 'Paiement{code: $code, type: $type, date: $date, amount: $amount, motif: $motif, account: $account}';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [code, motif, account];
}
