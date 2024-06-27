// Created by Jospin MAMBOU on 15/12/2022, 10:11
// Email websafe21@gmail.com
// Copyright (c) 2022. All rights reserved.
// Last modified 25/10/2022, 09:17

part of 'language_bloc.dart';

/// {@template LanguageEvent}
/// to define all event of language
///
/// {@endtemplate LanguageEvent}
abstract class LanguageEvent extends Equatable {
  /// {@macro language_event}
  const LanguageEvent();
}

/// Set new language
class LoadLanguage extends LanguageEvent {
  /// {@macro LoadLanguage}
  const LoadLanguage({required this.locale});

  /// to set language
  /// E.g:  const Locale swissFrench = Locale('fr', 'CH');
  ///       const Locale canadianFrench = Locale('fr', 'CA');
  final Locale locale;

  @override
  List<Object?> get props => [locale];
}
