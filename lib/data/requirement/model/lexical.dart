import 'package:equatable/equatable.dart';

class Lexical extends Equatable {
  final String? refer;
  final String? en;
  final String? fr;

  const Lexical({required this.refer, required this.en, required this.fr});

  @override
  List<Object?> get props => [refer, en, fr];
}
