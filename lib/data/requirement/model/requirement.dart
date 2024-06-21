import 'package:equatable/equatable.dart';

class Requirement extends Equatable {
  final List<Formula>? formulas;
  final List<Option>? options;

  const Requirement({required this.formulas, required this.options});

  @override
  List<Object?> get props => [options, formulas];
}

class Formula extends Equatable {
  final String? name;
  final String? code;
  final String? comment;
  final int? amount;
  final double? bonus;
  final List<Option>? options;

  const Formula({
    required this.name,
    required this.code,
    required this.comment,
    required this.amount,
    required this.bonus,
    required this.options,
  });


  @override
  String toString() {
    return 'Formula{name: $name, code: $code, comment: $comment, amount: $amount, bonus: $bonus, options: $options}';
  }

  @override
  List<Object?> get props => [name, amount, code, comment, options];
}

class Option extends Equatable {
  final String? name;
  final String? code;
  final String? comment;
  final int? amount;

  const Option(
      {required this.name,
      required this.comment,
      required this.code,
      required this.amount});

  @override
  String toString() {
    return 'Option{label: $name, code: $code, comment: $comment, amount: $amount}';
  }

  @override
  List<Object?> get props => [name, comment, code, amount];
}
