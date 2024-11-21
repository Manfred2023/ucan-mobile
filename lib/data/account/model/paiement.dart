// Created by Manfred MOUKATE on 6/26/24, 11:47 AM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/26/24, 11:47 AM

import 'package:equatable/equatable.dart';

class Paiement extends Equatable {
  final int? token;
  final int? amount;
  final String? budget;
  final DateTime? date;

  Paiement({
    this.token,
    this.amount,
    this.budget,
    this.date,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
