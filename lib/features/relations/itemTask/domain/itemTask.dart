import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'itemTask.freezed.dart';
part 'itemTask.g.dart';

@freezed
class ItemTask with _$ItemTask {
  const factory ItemTask({
    required String id,
    required String itemID,
    required String taskID,
  }) = _ItemTask;

  factory ItemTask.fromJson(Map<String, dynamic> json) => _$ItemTaskFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<ItemTask>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initialData/itemTasks.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => ItemTask.fromJson(jsonData)).toList();
  }
}