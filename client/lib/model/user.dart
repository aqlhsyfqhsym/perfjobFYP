// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

class User {
  User({
    this.user,
  });

  final List<UserElement> user;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        user: List<UserElement>.from(
            json["user"].map((x) => UserElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": List<dynamic>.from(user.map((x) => x.toJson())),
      };
}

class UserElement {
  UserElement({
    this.id,
    this.username,
    this.password,
    this.email,
    this.fullname,
    this.photo,
  });

  final int id;
  final String username;
  final String password;
  final String email;
  final String fullname;
  final String photo;

  factory UserElement.fromRawJson(String str) =>
      UserElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
        id: json["Id"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        fullname: json["fullname"],
        photo: json["Photo"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "username": username,
        "password": password,
        "email": email,
        "fullname": fullname,
        "Photo": photo,
      };
}
