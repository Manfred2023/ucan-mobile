// Created by Jospin MAMBOU on 15/12/2022, 10:15
// Email websafe21@gmail.com
// Copyright (c) 2022. All rights reserved.
// Last modified 09/11/2022, 10:40

import 'package:equatable/equatable.dart';

import '../../../model/authentication.dart';
import '../dba/country_dba.dart';

class CountryDb extends Equatable {
  ///
  const CountryDb({
    this.id,
    required this.code,
    required this.nameen,
    required this.namefr,
    required this.alpha1,
    required this.alpha2,
    this.dialcode,
  });

  /// empty Country
  const CountryDb.empty()
      : this(code: 0, nameen: '', namefr: '', alpha1: '', alpha2: '');

  final int? id;
  final int code;
  final String nameen;
  final String namefr;
  final String alpha1;
  final String alpha2;
  final int? dialcode;

  /// Returns a copy of this Contact with the given values updated.
  ///
  /// {@macro ContactPhoneTable}
  CountryDb copyWith({
    int? id,
    int? code,
    String? nameen,
    String? namefr,
    String? alpha2,
    String? alpha3,
    int? dialcode,
  }) =>
      CountryDb(
        id: id ?? this.id,
        code: code ?? this.code,
        nameen: nameen ?? this.nameen,
        namefr: namefr ?? this.namefr,
        alpha1: alpha2 ?? this.alpha1,
        dialcode: dialcode ?? this.dialcode,
        alpha2: alpha3 ?? this.alpha2,
      );

  Country toCountry() {
    return Country(
      code: code,
      nameen: nameen,
      namefr: namefr,
      alpha1: alpha1,
      dialcode: dialcode,
      alpha2: alpha2,
    );
  }

  static Future<CountryDb> fromCountry(Country country) async {
    final countryDb = await CountryDb.searchByAlpha2(country.code.toString());
    return CountryDb(
      id: countryDb?.id,
      code: country.code,
      nameen: country.nameen,
      namefr: country.namefr,
      alpha1: country.alpha1,
      dialcode: country.dialcode,
      alpha2: country.alpha1,
    );
  }

  @override
  String toString() {
    return 'Country{id: $id,\n code: $code,\n en: $nameen,\n fr: $namefr,\n alpha2: $alpha1,\n alpha3: $alpha2,\n dialcode: $dialcode\n}';
  }

  @override
  List<Object?> get props => [code, alpha2, alpha1, dialcode];

  /// save instance of country
  Future<CountryDb?> save() {
    return CountryDBA(country: this).save();
  }

  /// save instance of country
  static Future<CountryDb?> search(int id) {
    return CountryDBA(country: const CountryDb.empty()).get(id);
  }

  static Future<CountryDb?> searchByAlpha2(String alpha2) {
    return CountryDBA(country: const CountryDb.empty()).search(alpha2);
  }

  static Future<int> delete() {
    return CountryDBA(country: const CountryDb.empty()).deleteAll();
  }

  static Future<bool> exist(int id) async {
    if ((await search(id)) != null) {
      return true;
    } else {
      return false;
    }
  }
}
