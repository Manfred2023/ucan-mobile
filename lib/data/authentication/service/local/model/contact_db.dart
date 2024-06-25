// Created by Manfred MOUKATE on 6/25/24, 8:34 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/25/24, 8:34 PM

import '../../../model/authentication.dart';
import '../dba/contact_dba.dart';
import 'city_db.dart';

class ContactDb {
  /// {@macro SubscriberDbModel}
  ContactDb({
    required this.location,
    required this.id,
    required this.token,
    required this.gender,
    required this.lastname,
    required this.firstname,
    required this.mobile,
    required this.email,
    required this.city,
  });

  /// empty Country
  ContactDb.empty({
    this.location,
    this.id,
    this.token,
    this.gender,
    this.lastname,
    this.firstname,
    this.mobile,
    this.email,
    this.city,
  });

  final int? id;
  final int? token;
  final String? gender;

  final String? lastname;
  final String? firstname;
  final String? mobile;
  final String? email;
  final String? location;
  final CityDb? city;

  /// Returns a copy of this Account with the given values updated.
  ///
  /// {@macro AccountPhoneTable}
  ContactDb copyWith({
    int? id,
    int? token,
    String? gender,
    String? identifier,
    String? lastname,
    String? firstname,
    String? mobile,
    String? email,
    String? location,
    CityDb? city,
    String? language,
  }) =>
      ContactDb(
        id: id ?? this.id,
        token: token ?? this.token,
        gender: gender ?? this.gender,
        lastname: lastname ?? this.lastname,
        firstname: firstname ?? this.firstname,
        mobile: mobile ?? this.mobile,
        email: email ?? this.email,
        city: city ?? this.city,
        location: location ?? this.location,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactDb &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          token == other.token &&
          gender == other.gender &&
          lastname == other.lastname &&
          firstname == other.firstname &&
          mobile == other.mobile &&
          email == other.email &&
          location == other.location &&
          city == other.city;

  @override
  int get hashCode =>
      id.hashCode ^
      token.hashCode ^
      gender.hashCode ^
      lastname.hashCode ^
      firstname.hashCode ^
      mobile.hashCode ^
      email.hashCode ^
      location.hashCode ^
      city.hashCode;

  @override
  String toString() {
    return 'ContactDb{id: $id, token: $token, gender: $gender,   lastname: $lastname, firstname: $firstname, mobile: $mobile, email: $email, location: $location, city: $city, }';
  }

  /// save instance of SubscriberDbModel
  Future<ContactDb?> save() {
    return ContactDBA(contact: this).save();
  }

  Contact toContact() {
    return Contact(
      code: token,
      gender: gender,
      lastname: lastname,
      firstname: firstname,
      mobile: mobile,
      email: email,
      city: city?.toCity(),
      location: location,
    );
  }

  static Future<ContactDb> fromContact(Contact contact) async {
    final contactDb = await ContactDb.searchByCode(contact.code!);
    return ContactDb(
      id: contactDb?.id,
      token: contact.code,
      gender: contact.gender,
      lastname: contact.lastname,
      firstname: contact.firstname,
      mobile: contact.mobile,
      email: contact.email,
      city: contact.city != null ? await CityDb.fromCity(contact.city!) : null,
      location: contact.location,
    );
  }

  /// save instance of SubscriberDbModel
  static Future<ContactDb?> search(int id) {
    return ContactDBA(contact: ContactDb.empty()).get(id);
  }

  static Future<ContactDb?> searchByCode(int code) {
    return ContactDBA(contact: ContactDb.empty()).search(code);
  }

  static Future<int> delete() async {
    await ContactDBA(contact: ContactDb.empty()).deleteAll();
    return CityDb.delete();
  }

  static Future<ContactDb?> get() async {
    return await ContactDBA(contact: ContactDb.empty()).getFirst();
  }

  static Future<bool> exist(int id) async {
    if ((await search(id)) != null) {
      return true;
    } else {
      return false;
    }
  }
}
