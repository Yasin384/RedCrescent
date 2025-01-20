import 'dart:convert';

import 'package:red_crescent/src/core/enum/role_enum.dart';

// Helper functions for JSON conversion
LeaderBoard LeaderBoardFromJson(String str) => LeaderBoard.fromJson(json.decode(str));
String LeaderBoardToJson(LeaderBoard data) => json.encode(data.toJson());

class LeaderBoard {
  final int count;
  final String? next;
  final String? previous;
  final List<UserResult> results;

  LeaderBoard({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory LeaderBoard.fromJson(Map<String, dynamic> json) => LeaderBoard(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<UserResult>.from(json["results"].map((x) => UserResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class UserResult {
  final int id;
  final String? profilePictureUrl;
  final List<Achievement> achievements;
  final String password;
  final String? lastLogin;
  final bool isSuperuser;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final bool isStaff;
  final bool isActive;
  final DateTime dateJoined;
  final String? gender;
  final Role role;
  final String? phoneNumber;
  final String totalHours;
  final int xpPoints;
  final int? profilePictureWidth;
  final int? profilePictureHeight;
  final List<dynamic> groups;
  final List<dynamic> userPermissions;

  UserResult({
    required this.id,
    this.profilePictureUrl,
    required this.achievements,
    required this.password,
    this.lastLogin,
    required this.isSuperuser,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isStaff,
    required this.isActive,
    required this.dateJoined,
    this.gender,
    Role? role,
    this.phoneNumber,
    required this.totalHours,
    required this.xpPoints,
    this.profilePictureWidth,
    this.profilePictureHeight,
    required this.groups,
    required this.userPermissions,
  }) : role = role ?? Role.admin;

  factory UserResult.fromJson(Map<String, dynamic> json) => UserResult(
    id: json["id"],
    profilePictureUrl: json["profile_picture_url"],
    achievements: List<Achievement>.from(
        json["achievements"].map((x) => Achievement.fromJson(x))),
    password: json["password"],
    lastLogin: json["last_login"],
    isSuperuser: json["is_superuser"],
    username: json["username"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    isStaff: json["is_staff"],
    isActive: json["is_active"],
    dateJoined: DateTime.parse(json["date_joined"]),
    gender: json["gender"],
    role: Role.fromString(json["role"]),
    phoneNumber: json["phone_number"],
    totalHours: json["total_hours"],
    xpPoints: json["xp_points"],
    profilePictureWidth: json["profile_picture_width"],
    profilePictureHeight: json["profile_picture_height"],
    groups: List<dynamic>.from(json["groups"]),
    userPermissions: List<dynamic>.from(json["user_permissions"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "profile_picture_url": profilePictureUrl,
    "achievements": List<dynamic>.from(achievements.map((x) => x.toJson())),
    "password": password,
    "last_login": lastLogin,
    "is_superuser": isSuperuser,
    "username": username,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "is_staff": isStaff,
    "is_active": isActive,
    "date_joined": dateJoined.toIso8601String(),
    "gender": gender,
    "role": role,
    "phone_number": phoneNumber,
    "total_hours": totalHours,
    "xp_points": xpPoints,
    "profile_picture_width": profilePictureWidth,
    "profile_picture_height": profilePictureHeight,
    "groups": List<dynamic>.from(groups),
    "user_permissions": List<dynamic>.from(userPermissions),
  };
}

class Achievement {
  final int id;
  final String name;
  final String description;
  final int criteriaHours;
  final int criteriaTasks;

  Achievement({
    required this.id,
    required this.name,
    required this.description,
    required this.criteriaHours,
    required this.criteriaTasks,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) => Achievement(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    criteriaHours: json["criteria_hours"],
    criteriaTasks: json["criteria_tasks"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "criteria_hours": criteriaHours,
    "criteria_tasks": criteriaTasks,
  };
}