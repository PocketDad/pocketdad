import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  const factory Item({
    required String id,
    required String name,
    required String icon}) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<Item>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initialData/gardens.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => Item.fromJson(jsonData)).toList();
  }
}
