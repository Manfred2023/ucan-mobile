import 'package:equatable/equatable.dart';

class User extends Equatable {
  //final Contact contact;
  final String email;
  final String? mobile;

  const User({
    //required this.contact,
    required this.email,
    this.mobile,
  });

  @override
  String toString() {
    return 'User{ email: $email, mobile: $mobile, }';
  }

  @override
  List<Object?> get props => [
        mobile,
      ];
}
