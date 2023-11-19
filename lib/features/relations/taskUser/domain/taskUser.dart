import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'taskUser.freezed.dart';
part 'taskUser.g.dart';

@freezed
class TaskUser with _$TaskUser {
  const factory TaskUser({
    required String id,
    required String taskID,
    required String userID,
  }) = _TaskUser;

  factory TaskUser.fromJson(Map<String, dynamic> json) => _$TaskUserFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<TaskUser>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initialData/taskUsers.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => TaskUser.fromJson(jsonData)).toList();
  }
}