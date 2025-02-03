// Функции для преобразования JSON
import 'dart:convert';

Participation participationResponseFromJson(String str) => Participation.fromJson(json.decode(str));
String participationResponseFromJsonResponseToJson(Participation data) => json.encode(data.toJson());

class Participation {
  final bool isParticipating;

  Participation({required this.isParticipating});

  factory Participation.fromJson(Map<String, dynamic> json) => Participation(
    isParticipating: json["is_participating"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "is_participating": isParticipating,
  };
}
