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
}
