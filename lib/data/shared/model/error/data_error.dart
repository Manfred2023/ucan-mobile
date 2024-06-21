import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../requirement/service/remote/model/city_api_model.dart';

part 'data_error.freezed.dart';

@freezed
class DataError with _$DataError implements Exception {
  const factory DataError.unknown({
    Object? error,
  }) = _unknown;

  const factory DataError.apiError({String? reason}) = _apiError;
  const factory DataError.authError({String? reason}) = _authError;

  const factory DataError.error404() = _error404;
  const factory DataError.decoderErrorSearch(
      {DecoderErrorSearchApiModel? data}) = _decoderErrorSearch;
}
