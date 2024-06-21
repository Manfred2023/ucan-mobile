// Created by Jospin MAMBOU on 15/12/2022, 10:15
// Email websafe21@gmail.com
// Copyright (c) 2022. All rights reserved.
// Last modified 10/11/2022, 09:09

import 'package:equatable/equatable.dart';

import '../../../model/city.dart';
import '../dba/cities_dba.dart';

class CitiesDb extends Equatable {
  /// {@macro City}
  const CitiesDb({
    this.id,
    required this.code,
    required this.name,
  });

  /// empty Country
  const CitiesDb.empty() : this(name: '', code: '');

  final int? id;
  final String code;
  final String name;

  /// Returns a copy of this City with the given values updated.
  ///
  /// {@macro ContactPhoneTable}
  CitiesDb copyWith({
    int? id,
    String? name,
    String? code,
  }) =>
      CitiesDb(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
      );

  CitySimple toCitySimple() {
    return CitySimple(
      name: name,
      code: code,
    );
  }

  static Future<CitiesDb> fromCity(CitySimple city) async {
    final cityDb = await CitiesDb.searchByName(city.name.toString());
    return CitiesDb(
      id: cityDb?.id,
      name: city.name!,
      code: city.code!,
    );
  }

  @override
  String toString() {
    return 'CitiesDb{id: $id, code: $code, name: $name}';
  }

  @override
  List<Object?> get props => [id, name, code];

  /// save instance of country
  Future<CitiesDb?> save() {
    return CitiesDBA(city: this).save();
  }

  /// save instance of country
  static Future<CitiesDb?> search(int id) {
    return CitiesDBA(city: const CitiesDb.empty()).get(id);
  }

  static Future<CitiesDb?> searchByName(String name) {
    return CitiesDBA(city: const CitiesDb.empty()).search(name);
  }

  static Future<int> delete() async {
    return await CitiesDBA(city: const CitiesDb.empty()).deleteAll();
  }

  static Future<List<CitiesDb>?> getAll() async {
    return CitiesDBA(city: const CitiesDb.empty()).getAll();
  }

  static Future<bool> exist(int id) async {
    if ((await search(id)) != null) {
      return true;
    } else {
      return false;
    }
  }
}
