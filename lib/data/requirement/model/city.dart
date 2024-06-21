import 'package:equatable/equatable.dart';

import '../../authentication/model/authentication.dart';

class Cities extends Equatable {
  final List<CitySimple>? cites;
  final Country? country;
  final int version;

  const Cities(
      {required this.version, required this.cites, required this.country});

  @override
  List<Object?> get props => [cites, country];
}

class CitySimple extends Equatable {
  final String? code;
  final String? name;

  const CitySimple({required this.code, required this.name});

  @override
  List<Object?> get props => [code, name];

  @override
  String toString() {
    return 'CitySimple{code: $code, name: $name}';
  }
}
