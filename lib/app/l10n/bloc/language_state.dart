// Created by Jospin MAMBOU on 15/12/2022, 10:11
// Email websafe21@gmail.com
// Copyright (c) 2022. All rights reserved.
// Last modified 25/10/2022, 09:17

part of 'language_bloc.dart';

/// {@template LanguageEvent}
/// to define all event of language
///
/// {@endtemplate LanguageEvent}
class LanguageState extends Equatable {
  /// {@macro language_bloc}
  const LanguageState({required this.locale});

  /// initialisation in o phone's language

  factory LanguageState.initial() =>
      LanguageState(locale: Locale(Platform.localeName.split('_')[0]));

  /// Converts this [Map] into a [LanguageState].
  factory LanguageState.fromJson(Map<String, dynamic> json) {
    var languageCode = json['languageCode'].split('_')[0];
    if (languageCode != 'en' || languageCode != 'fr') {
      languageCode = 'fr';
    }
    return LanguageState(
      locale: Locale(
        languageCode,
        json['countryCode'] as String?,
      ),
    );
  }

  /// to set language
  /// E.g:  const Locale swissFrench = Locale('fr', 'CH');
  ///       const Locale canadianFrench = Locale('fr', 'CA');
  final Locale locale;

  /// copy function
  LanguageState copyWith({required Locale? locale}) =>
      LanguageState(locale: locale ?? this.locale);

  /// Converts this [LanguageState] into a [Map].
  Map<String, dynamic> toJson() => <String, dynamic>{
        'languageCode': locale.languageCode.split('_')[0],
        'countryCode': locale.countryCode
      };

  @override
  List<Object> get props => [locale];
}
