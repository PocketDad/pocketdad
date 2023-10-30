import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocketdad/src/data_models/user_db.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../item_db.dart';

class ItemUserData {
  ItemUserData({
        required this.itemID,
        required this.userID,
      });
  String itemID;
  String userID;
}

class ItemUserDB {
  ItemUserDB(this.ref);

  final ProviderRef<ItemUserDB> ref;

  final List<ItemUserData> _itemUsers = [
    ItemUserData(
      itemID: 'item-001',
      userID: 'user-001',
    ),
    ItemUserData(
      itemID: 'item-001',
      userID: 'user-002',
    ),
    ItemUserData(
      itemID: 'item-002',
      userID: 'user-003',
    ),
    ItemUserData(
      itemID: 'item-003',
      userID: 'user-004',
    ),
    ItemUserData(
      itemID: 'item-003',
      userID: 'user-001',
    ),
  ];

  List<UserData> getAssociatedUsers(String itemID) {
    UserDB userDB = ref.read(userDBProvider);
    List<String> userIDs = _itemUsers.where((data) => data.itemID == itemID).map((data) => data.userID).toList();
    return userDB.getUsers(userIDs);
  }

  List<ItemData> getAssociatedItems(String userID) {
    ItemDB itemDB = ref.read(itemDBProvider);
    List<String> itemIDs = _itemUsers.where((data) => data.userID == userID).map((data) => data.itemID).toList();
    return itemDB.getItems(itemIDs);
  }
}
