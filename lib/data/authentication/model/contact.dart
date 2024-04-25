import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final int? id;
  final String? gender;
  final String? identifier;
  final String? lastname;
  final String? firstname;
  final String? mobile;
  final String? email;
  final String? location;
  final String? name;
  final String? city;
  final String? language;

  const Contact(
      this.id,
      this.gender,
      this.identifier,
      this.lastname,
      this.firstname,
      this.mobile,
      this.email,
      this.location,
      this.name,
      this.city,
      this.language);

  @override
  // TODO: implement props
  List<Object?> get props => [mobile, lastname, email];

  @override
  String toString() {
    return 'Contact{id: $id, gender: $gender, identifier: $identifier, lastname: $lastname, firstname: $firstname, mobile: $mobile, email: $email, location: $location, name: $name, city: $city, language: $language}';
  }
}
