import '../../item/domain/item.dart';
import '../../relations/itemTask/domain/itemTask_collection.dart';
import '../../relations/itemUser/domain/itemUser_collection.dart';
import '../../user/domain/user.dart';
import '../../user/domain/user_collection.dart';

/// Encapsulates operations on the list of [Item] returned from Firestore.
class ItemCollection {
  ItemCollection(items) : _items = items;

  final List<Item> _items;

  Item getItem(String itemID) {
    return _items.firstWhere((item) => item.id == itemID);
  }

  List<Item> getItems(List<String> itemIDs) {
    return _items.where((item) => itemIDs.contains(item.id)).toList();
  }

  List<User> getAssociatedUsers(String itemID, UserCollection userCollection, ItemUserCollection itemUserCollection) {
    return userCollection.getUsers(itemUserCollection.getUserIDsWithItemID(itemID));
  }

  List<Item> getAssociatedTasks(String taskID, ItemCollection itemCollection, ItemTaskCollection itemTaskCollection) {
    return itemCollection.getItems(itemTaskCollection.getItemIDsWithTaskID(taskID));
  }

  int size() {
    return _items.length;
  }

  List<String> getItemIDs() {
    return _items.map((data) => data.id).toList();
  }
}
