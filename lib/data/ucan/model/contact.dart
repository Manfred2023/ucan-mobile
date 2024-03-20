import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Contact extends Equatable {
  final int? id;
  final String? username;
  final String? mobile;
  final String? email;
  final String? whatsapp;
  final String? pin;
  const Contact({
    this.id,
    this.username,
    this.mobile,
    this.email,
    this.pin,
    this.whatsapp, 
  });
  Contact copyWith({
    int? id,
    String? username,
    String? mobile,
    String? email,
    String? whatsapp,
    String? pin,
  }) =>
      Contact(
        id: id ?? this.id,
        username: username ?? this.username,
        mobile: mobile ?? this.mobile,
        email: email ?? this.email,
        pin: pin ?? this.pin, 
        whatsapp: whatsapp ?? this.whatsapp, 
      );

  @override
  List<Object?> get props => [id, mobile];

  @override
  String toString() { 
    return'WaContact{id: $id, username: $username, mobile: $mobile, email: $email, whatsapp: $whatsapp,  }';
 
  }


}
