// Created by Manfred MOUKATE on 11/21/24, 4:00 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 11/21/24, 4:00 PM
import 'package:equatable/equatable.dart';

class Budget extends Equatable {
  final int? code;
  final String? name;
  final int? ceiling;

  Budget({
    this.code,
    this.name,
    this.ceiling,
  });

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  String toString() {
    return 'Budget{token: $code, name: $name, ceiling: $ceiling}';
  }
}
