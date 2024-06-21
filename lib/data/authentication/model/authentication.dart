import 'package:equatable/equatable.dart';

class Authentication extends Equatable {
  final String? token;
  final String? device;
  final String? pin;
  final String? code;
  final Contact? contact;

  Authentication({this.token, this.device, this.pin, this.code, this.contact});

  @override
  String toString() {
    return 'Authentication{token: $token, device: $device, pin: $pin, code: $code, contact: $contact}';
  }

  @override
  List<Object?> get props => [token, device, code, contact];
}

class Contact extends Equatable {
  final int? code;
  final String? gender;
  final String? lastname;
  final String? firstname;
  final String? mobile;
  final String? email;
  final String? location;
  final City? city;

  const Contact({
    required this.location,
    required this.code,
    required this.gender,
    required this.lastname,
    required this.firstname,
    required this.mobile,
    required this.email,
    required this.city,
  });

  @override
  String toString() {
    return 'Contact{code: $code, gender: $gender,  lastname: $lastname, firstname: $firstname, mobile: $mobile, email: $email, location: $location,   city: $city, }';
  }

  @override
  List<Object?> get props => [code, lastname, mobile, city];

  /* String formatName() {
    var name =
        '${firstname != null ? firstname!.ucfirst2() : ''} ${lastname.toString().toUpperCase()}';
    if (name.length > 20) {
      name = '${name.substring(0, 19)}...';
    }
    return name;
  }*/

  String locationName() {
    var name = location ?? '';
    if (name.length > 20) {
      name = '${name.substring(0, 19)}...';
    }
    return name;
  }

  String initial() {
    return '${firstname != null ? firstname![0] : ''}${lastname.toString()[0]}';
  }
}

class City extends Equatable {
  /// {@macro City}
  const City({
    required this.name,
    required this.code,
    required this.country,
  });

  final String name;
  final String? code;
  final Country country;

  @override
  List<Object?> get props => [name, country];
}

class Country extends Equatable {
  ///
  const Country({
    required this.code,
    required this.nameen,
    required this.namefr,
    required this.alpha1,
    required this.alpha2,
    required this.dialcode,
  });

  final int code;
  final String nameen;
  final String namefr;
  final String alpha1;
  final String alpha2;
  final int? dialcode;

  @override
  List<Object?> get props => [code, alpha1, alpha2];
}
