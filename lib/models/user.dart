// Generam la classe a partir de la API i del Quicktipe.io
import 'dart:convert';

class User {
  int? id;
  String email;
  String firstName;
  String lastName;
  String? avatar;

  // Constructor
  User({
    this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.avatar,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  // Map<String, dynamic> toMap() => {
  //     "id": id,
  //     "email": email,
  //     "first_name": firstName,
  //     "last_name": lastName,
  //     "avatar": avatar,
  // };
}
