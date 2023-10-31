import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/features/user/domain/user_db.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class ItemData {
  ItemData(
    {required this.id,
    required this.name,
    required this.icon,
    });
  String id;
  String name;
  String icon;
}

class ItemDB {
  ItemDB(this.ref);

  final ProviderRef<ItemDB> ref;
  final List<ItemData> _items = [
    ItemData(
      id: 'item-001',
      name:  'Car',
      icon: "assets/images/car.png",
    ),
    ItemData(
      id: 'item-002',
      name:  'House',
      icon: "assets/images/house.png",
    ),
    ItemData(
      id: 'item-003',
      name:  'Condo',
      icon: "assets/images/condo.png",
    ),
  ];

  ItemData getItem(String itemID) {
    return _items.firstWhere((data) => data.id == itemID);
  }

  List<ItemData> getItems(List<String> itemIDs) {
    return itemIDs.map((itemID) => getItem(itemID)).toList();
  }

  List<String> getItemNames() {
    return _items.map((item) => item.name).toList();
  }

  String getItemIDFromName(String name) {
    return _items.firstWhere((item) => item.name == name).id;
  }
}
