// Created by Manfred MOUKATE on 6/25/24, 8:34 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/25/24, 8:34 PM

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
    String? alpha1,
    String? alpha2,
    int? dialcode,
  }) =>
      CountryDb(
        id: id ?? this.id,
        code: code ?? this.code,
        nameen: nameen ?? this.nameen,
        namefr: namefr ?? this.namefr,
        dialcode: dialcode ?? this.dialcode,
        alpha1: alpha1 ?? this.alpha1,
        alpha2: alpha2 ?? this.alpha2,
      );

  Country toCountry() {
    return Country(
      code: code,
      nameen: nameen,
      namefr: namefr,
      alpha1: alpha1,
      alpha2: alpha2,
      dialcode: dialcode,
    );
  }

  static Future<CountryDb> fromCountry(Country country) async {
    final countryDb = await CountryDb.searchByAlpha1(country.alpha1);
    return CountryDb(
      id: countryDb?.id,
      code: country.code,
      namefr: country.namefr,
      nameen: country.nameen,
      alpha1: country.alpha1,
      alpha2: country.alpha2,
      dialcode: country.dialcode,
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

  static Future<CountryDb?> searchByAlpha1(String alpha1) {
    return CountryDBA(country: const CountryDb.empty()).search(alpha1);
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
