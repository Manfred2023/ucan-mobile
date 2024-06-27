// Created by Manfred MOUKATE on 6/25/24, 8:33 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/25/24, 8:33 PM

import 'package:equatable/equatable.dart';
import 'package:ucan/data/account/model/motif.dart';

import '../dba/motif_dba.dart';

class MotifDb extends Equatable {
  ///
  const MotifDb({
    this.id,
    required this.code,
    required this.name,
  });

  /// empty Country
  const MotifDb.empty()
      : this(
          code: 0,
          name: '',
        );

  final int? id;
  final int code;
  final String name;

  /// Returns a copy of this Contact with the given values updated.
  ///
  /// {@macro ContactPhoneTable}
  MotifDb copyWith({int? id, int? code, String? name}) => MotifDb(
      id: id ?? this.id, code: code ?? this.code, name: name ?? this.name);

  Motif toMotif() {
    return Motif(code: code, name: name);
  }

  static Future<MotifDb> fromMotif(Motif motif) async {
    return MotifDb(
      code: motif.code!,
      name: motif.name!,
    );
  }

  @override
  String toString() {
    return 'MotifDb{id: $id, code: $code, name: $name}';
  }

  @override
  List<Object?> get props => [code, name];

  /// save instance of country
  Future<MotifDb?> save() {
    return MotifDBA(motifDb: this).save();
  }

  /// save instance of country
  static Future<MotifDb?> search(int id) {
    return MotifDBA(motifDb: const MotifDb.empty()).get(id);
  }

  static Future<MotifDb?> searchCode(int code) {
    return MotifDBA(motifDb: const MotifDb.empty()).searchCode(code);
  }

  static Future<MotifDb?> searchByName(String name) {
    return MotifDBA(motifDb: const MotifDb.empty()).search(name);
  }

  static Future<int> delete() {
    return MotifDBA(motifDb: const MotifDb.empty()).deleteAll();
  }

  static Future<List<MotifDb>> getAll() {
    return MotifDBA(motifDb: MotifDb.empty()).getAll();
  }

  static Future<bool> exist(int id) async {
    if ((await search(id)) != null) {
      return true;
    } else {
      return false;
    }
  }
}
