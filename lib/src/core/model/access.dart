// To parse this JSON data, do
//
//     final access = accessFromJson(jsonString);


import 'dart:convert';

Access accessFromJson(String str) => Access.fromJson(json.decode(str));

String accessToJson(Access data) => json.encode(data.toJson());

class Access {
  final String access;
  final String refresh;
  final String user;

  Access({
    required this.access,
    required this.refresh,
    required this.user,
  });

  Access copyWith({
    String? access,
    String? refresh,
    String? user,
  }) =>
      Access(
        access: access ?? this.access,
        refresh: refresh ?? this.refresh,
        user: user ?? this.user,
      );

  factory Access.fromJson(Map<String, dynamic> json) => Access(
        access: json["access"],
        refresh: json["refresh"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "access": access,
        "refresh": refresh,
        "user": user,
      };
}
