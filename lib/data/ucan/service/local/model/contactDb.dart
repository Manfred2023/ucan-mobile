 

import 'package:equatable/equatable.dart';
import 'package:ucan/data/ucan/model/contact.dart';

class ContactDb extends Equatable {
  final int? id;
  final String? username;
  final String? mobile;
  final String? email;
  final String? whatsapp;
  final String? pin;

  const ContactDb(
      {this.id,
      this.email,
      this.mobile,
      this.pin,
      this.username,
      this.whatsapp});

  Contact toContactDb() {
    return Contact(
        email: email,
        id: id,
        mobile: mobile,
        pin: pin,
        username: username,
        whatsapp: whatsapp);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, email, mobile];
}
