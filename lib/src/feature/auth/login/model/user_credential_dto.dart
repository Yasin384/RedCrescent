// To parse this JSON data, do
//
//     final userCredentialDto = userCredentialDtoFromJson(jsonString);

import 'dart:convert';

UserCredentialDto userCredentialDtoFromJson(String str) =>
    UserCredentialDto.fromJson(json.decode(str));

String userCredentialDtoToJson(UserCredentialDto data) =>
    json.encode(data.toJson());

class UserCredentialDto {
  final String username;
  final String password;

  UserCredentialDto({
    required this.username,
    required this.password,
  });

  UserCredentialDto copyWith({
    String? username,
    String? password,
  }) =>
      UserCredentialDto(
        username: username ?? this.username,
        password: password ?? this.password,
      );

  factory UserCredentialDto.fromJson(Map<String, dynamic> json) =>
      UserCredentialDto(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
