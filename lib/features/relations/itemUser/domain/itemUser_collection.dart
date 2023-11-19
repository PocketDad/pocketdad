import 'itemUser.dart';

/// Encapsulates operations on the list of [ItemUser] returned from Firestore.
class ItemUserCollection {
  ItemUserCollection(itemUsers) : _itemUsers = itemUsers;

  final List<ItemUser> _itemUsers;

  List<ItemUser> getItemUsers() {
    return _itemUsers;
  }

  int size() {
    return _itemUsers.length;
  }

  List<String> getItemIDsWithUserID(userID) {
    return _itemUsers.where((itemUser) => itemUser.userID == userID).map((itemUser) => itemUser.itemID).toList();
  }

  List<String> getUserIDsWithItemID(itemID) {
    return _itemUsers.where((itemUser) => itemUser.itemID == itemID).map((itemUser) => itemUser.userID).toList();
  }
}
