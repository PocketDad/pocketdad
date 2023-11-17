import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'itemUser.freezed.dart';
part 'itemUser.g.dart';

@freezed
class ItemUser with _$ItemUser {
  const factory ItemUser({
    required String id,
    required String ItemID,
    required String UserID,
  }) = _ItemUser;

  factory ItemUser.fromJson(Map<String, dynamic> json) => _$ItemUserFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<ItemUser>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initialData/itemUsers.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => ItemUser.fromJson(jsonData)).toList();
  }
}