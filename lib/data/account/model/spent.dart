// Created by Manfred MOUKATE on 11/21/24, 5:24 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 11/21/24, 5:24 PM

import 'package:equatable/equatable.dart';
import 'package:ucan/data/account/model/paiement.dart';

class Spent extends Equatable {
  final int? total;
  final List<Paiement>? paiements;

  Spent({
    this.total,
    this.paiements,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
