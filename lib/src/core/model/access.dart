// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final access = accessFromJson(jsonString);

import 'dart:convert';

Access accessFromJson(String str) => Access.fromJson(json.decode(str));

String accessToJson(Access data) => json.encode(data.toJson());

class Access {
  final String access;
  final String refresh;
  final User user;

  Access({
    required this.access,
    required this.refresh,
    required this.user,
  });

  factory Access.fromJson(Map<String, dynamic> json) => Access(
        access: json["access"],
        refresh: json["refresh"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access": access,
        "refresh": refresh,
        "user": user.toJson(),
      };
}

class User {
  final int id;
  final String username;
  final String email;
  final bool isStaff;
  final bool isActive;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? role;
  final String? phoneNumber;
  final String totalHours;
  final int xpPoints;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.isStaff,
    required this.isActive,
    this.firstName,
    this.lastName,
    this.gender,
    this.role,
    this.phoneNumber,
    required this.totalHours,
    required this.xpPoints,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        isStaff: json["is_staff"],
        isActive: json["is_active"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        role: json["role"],
        phoneNumber: json["phone_number"],
        totalHours: json["total_hours"],
        xpPoints: json["xp_points"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "is_staff": isStaff,
        "is_active": isActive,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "role": role,
        "phone_number": phoneNumber,
        "total_hours": totalHours,
        "xp_points": xpPoints,
      };

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, isStaff: $isStaff, isActive: $isActive, firstName: $firstName, lastName: $lastName, gender: $gender, role: $role, phoneNumber: $phoneNumber, totalHours: $totalHours, xpPoints: $xpPoints)';
  }
}

