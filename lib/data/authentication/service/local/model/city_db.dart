// Created by Manfred MOUKATE on 6/25/24, 8:34 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/25/24, 8:34 PM

import 'package:equatable/equatable.dart';

import '../../../model/authentication.dart';
import '../dba/city_dba.dart';
import 'country_db.dart';

class CityDb extends Equatable {
  /// {@macro City}
  const CityDb({
    this.id,
    required this.name,
    required this.code,
    required this.country,
  });

  /// empty Country
  const CityDb.empty()
      : this(name: '', country: const CountryDb.empty(), code: '');

  final int? id;
  final String name;
  final String? code;
  final CountryDb country;

  /// Returns a copy of this City with the given values updated.
  ///
  /// {@macro ContactPhoneTable}
  CityDb copyWith({
    int? id,
    String? name,
    String? code,
    CountryDb? country,
  }) =>
      CityDb(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        country: country ?? this.country,
      );

  City toCity() {
    return City(
      name: name,
      code: code,
      country: country.toCountry(),
    );
  }

  static Future<CityDb> fromCity(City city) async {
    final cityDb = await CityDb.searchByName(city.name.toString());
    return CityDb(
      id: cityDb?.id,
      name: city.name,
      code: city.code,
      country: await CountryDb.fromCountry(city.country),
    );
  }

  @override
  String toString() {
    return 'City{id: $id,\n name: $name,\n country: $country\n}';
  }

  @override
  List<Object?> get props => [id, name, country];

  /// save instance of country
  Future<CityDb?> save() {
    return CityDBA(city: this).save();
  }

  /// save instance of country
  static Future<CityDb?> search(int id) {
    return CityDBA(city: const CityDb.empty()).get(id);
  }

  static Future<CityDb?> searchByName(String name) {
    return CityDBA(city: const CityDb.empty()).search(name);
  }

  static Future<int> delete() async {
    await CityDBA(city: const CityDb.empty()).deleteAll();
    return CountryDb.delete();
  }

  static Future<bool> exist(int id) async {
    if ((await search(id)) != null) {
      return true;
    } else {
      return false;
    }
  }
}
