import 'user_db.dart';

class ItemData {
  ItemData(
    {required this.id,
    required this.name,
    required this.userIDs,
    });
  String id;
  String name;
  List<String> userIDs;
}

class ItemDB {
  final List<ItemData> _items = [
    ItemData(
      id: 'item-001',
      name:  'Car',
      userIDs: ['user-001', 'user-002'],
    ),
    ItemData(
      id: 'item-002',
      name:  'House',
      userIDs: [],
    ),
    ItemData(
      id: 'item-003',
      name:  'Condo',
      userIDs: [],
    ),
  ];

  ItemData getItem(String itemID) {
    return _items.firstWhere((data) => data.id == itemID);
  }

  List<String> getAllItems() {
    return _items.map((data) => data.id).toList();
  }

  List<ItemData> getAssignedItems(String userID) {
    return _items.where((data) => data.id == userID).toList();
  }

  List<String> getAssociatedUsers(String itemID) {
    return getItem(itemID).userIDs;
  }
}
