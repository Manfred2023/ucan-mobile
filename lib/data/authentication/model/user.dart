import 'package:equatable/equatable.dart';
import 'package:ucan/data/authentication/model/contact.dart';

class User extends Equatable {
  final int id;
  final Contact contact;
  final String email;
  final String mobile;
  final String passcode;

  const User(this.id,
      {required this.contact,
      required this.email,
      required this.mobile,
      required this.passcode});

  @override
  String toString() {
    return 'User{contact: $contact, email: $email, mobile: $mobile, passcode: $passcode}';
  }

  @override
  List<Object?> get props => [mobile, contact];
}
