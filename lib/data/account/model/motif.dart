// Created by Manfred MOUKATE on 6/25/24, 8:18 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/25/24, 8:18 PM

import 'package:equatable/equatable.dart';

class Motif extends Equatable {
  final int? code;
  final String? name;

  Motif({
    this.code,
    this.name,
  });

  @override
  String toString() {
    return 'Motif{code: $code, name: $name}';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name];
}
