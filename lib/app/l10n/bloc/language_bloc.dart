// Created by Jospin MAMBOU on 15/12/2022, 10:11
// Email websafe21@gmail.com
// Copyright (c) 2022. All rights reserved.
// Last modified 25/10/2022, 09:17

import 'dart:io';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'language_event.dart';
part 'language_state.dart';

///
class LanguageBloc extends HydratedBloc<LanguageEvent, LanguageState> {
  ///
  LanguageBloc(LanguageState initialState) : super(initialState) {
    on<LanguageEvent>((event, emit) {
      if (event is LoadLanguage) {
        emit(LanguageState(locale: event.locale));
      }
    });
  }

  ///
  LanguageState get initialState => LanguageState.initial();

  @override
  LanguageState fromJson(Map<String, dynamic> json) {
    return LanguageState.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(LanguageState state) {
    return state.toJson();
  }
}
