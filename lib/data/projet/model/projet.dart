// Created by Manfred MOUKATE on 7/16/24, 8:12 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 7/16/24, 8:12 PM

import 'package:equatable/equatable.dart';

class Projet extends Equatable {
  final int? id;
  final int? code;
  final String? name;
  final String? charcode;
  final String? color;

  Projet(this.id, this.code, this.name, this.charcode, this.color);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
