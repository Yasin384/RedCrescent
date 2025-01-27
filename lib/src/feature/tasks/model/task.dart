import 'dart:convert';

// Функции для преобразования JSON
Tasks tasksResponseFromJson(String str) => Tasks.fromJson(json.decode(str));
String tasksResponseToJson(Tasks data) => json.encode(data.toJson());

class Tasks {
  final int count;
  final String? next;
  final String? previous;
  final List<TaskResult> results;

  Tasks({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory Tasks.fromJson(Map<String, dynamic> json) => Tasks(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<TaskResult>.from(
        json["results"].map((x) => TaskResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };

  Tasks merge(Tasks newTasks) {
    return Tasks(
      count: newTasks.count,
      next: newTasks.next,
      previous: previous,
      results: [...results, ...newTasks.results],
    );
  }
}

class TaskResult {
  final int id;
  final String? photo;
  final String title;
  final String description;
  final String status;
  final DateTime dueDate;
  final String hoursToComplete;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isPublic;
  final Coordinator? coordinator; // Изменено на Coordinator
  final List<dynamic> assignedVolunteers;
  final String? location; // Добавлено поле location

  TaskResult({
    required this.id,
    this.photo,
    required this.title,
    required this.description,
    required this.status,
    required this.dueDate,
    required this.hoursToComplete,
    required this.createdAt,
    required this.updatedAt,
    required this.isPublic,
    this.coordinator,
    required this.assignedVolunteers,
    this.location,
  });

  factory TaskResult.fromJson(Map<String, dynamic> json) => TaskResult(
    id: json["id"],
    photo: json["photo"],
    title: json["title"],
    description: json["description"],
    status: json["status"],
    dueDate: DateTime.parse(json["due_date"]),
    hoursToComplete: json["hours_to_complete"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isPublic: json["is_public"],
    coordinator: json["coordinator"] != null ? Coordinator.fromJson(json["coordinator"]) : null, // Обработка null для координатора
    assignedVolunteers: List<dynamic>.from(json["assigned_volunteers"] ?? []),
    location: json["location"], // Если location отсутствует, будет null
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "photo": photo,
    "title": title,
    "description": description,
    "status": status,
    "due_date": dueDate.toIso8601String(),
    "hours_to_complete": hoursToComplete,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "is_public": isPublic,
    "coordinator": coordinator?.toJson(), // Если координатор есть, возвращаем его JSON
    "assigned_volunteers": List<dynamic>.from(assignedVolunteers.map((x) => x)),
    "location": location, // Добавлено поле location
  };
}

class Coordinator {
  final int? id;
  final String? username;
  final String? email;

  Coordinator({
    this.id,
    this.username,
    this.email,
  });

  factory Coordinator.fromJson(Map<String, dynamic> json) => Coordinator(
    id: json["id"],
    username: json["username"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
  };
}

