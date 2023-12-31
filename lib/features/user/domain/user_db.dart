import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../task/domain/task_db.dart';
import '../../item/domain/item_db.dart';

class UserData {
  UserData(
      {required this.id,
      required this.name,
      required this.email,
      required this.username,
      this.dadName = "PocketDad",
      this.dadPic = "assets/images/dad1.JPG"} // ask about setting unique
      );
  String id;
  String name;
  String email;
  String username;
  String dadName;
  String dadPic; // default should be some random picture
}

class UserDB {
  UserDB(this.ref);

  final ProviderRef<UserDB> ref;
  final List<UserData> _users = [
    UserData(
        id: 'user-001',
        name: 'John Doe',
        email: 'johndoe@gmail.com',
        username: 'johndoe',
        dadName: "John's dad",
        dadPic: "assets/images/dad2.JPG"),
    UserData(
        id: 'user-002',
        name: 'Jane Roe',
        email: 'janeroe@gmail.com',
        username: 'janeroe002',
        dadName: "Jane's dad",
        dadPic: "assets/images/dad3.JPG"),
    UserData(
        id: 'user-003',
        name: 'Justin Jandoc',
        email: 'justinjandoc@hawaii.com',
        username: 'justinjandoc',
        dadName: "justin's dad",
        dadPic: "assets/images/dad4.JPG"),
    UserData(
        id: 'user-004',
        name: 'Sydney Kim',
        email: 'sydneykim@hawaii.com',
        username: 'sydneykim',
        dadName: "Sydney's dad",
        dadPic: "assets/images/dad6.JPG"),
    UserData(
        id: 'user-005',
        name: 'Yong-Sung Masuda',
        email: 'yongsungmasuda@hawaii.com',
        username: 'yongsungmasuda',
        dadName: "Yong-Sung's dad",
        dadPic: "assets/images/dad5.JPG"),
  ];

  UserData getUser(String userID) {
    return _users.firstWhere((userData) => userData.id == userID);
  }

  UserData? getUsername(String username) {
    try {
      return _users.firstWhere((userData) => userData.username == username);
    } catch (e) {
      if (e is StateError) {}
    }
    return null;
  }

  List<UserData> getUsers(List<String> userIDs) {
    return userIDs.map((userID) => getUser(userID)).toList();
  }

  int getNextUserNum() {
    return (_users.length + 1);
  }

  List<String> getUserNames() {
    return _users.map((user) => user.name).toList();
  }

  List<String> getUserIDs(List<UserData> users) {
    return _users.map((user) => user.id).toList();
  }

  List<String> getUserUsernames() {
    return _users.map((user) => user.username).toList();
  }

  List<String> getUserIDsFromString(String userNames) {
    List<String> validUsers = getUserUsernames();
    List<String> userInputs = userNames.split(',').map((e) => e.trim()).toList();
    List<String> ret = [];
    for (final i in userInputs) {
      // only valid usernames
      if (validUsers.contains(i)) {
        ret.add(i);
      }
    }
    for (int i = 0; i < ret.length; i++) {
      if(ret[i] != null){
        ret[i] = getUsername(ret[i])!.id;
      }
    }
    print(validUsers);
    print(ret);
    return ret;
  }

  List<String> validateUserNames(List<String> userNames) {
    List<String> validUsers = getUserUsernames();
    List<String> userInputs = userNames;
    List<String> ret = [];
    for (final i in userInputs) {
      // only valid usernames
      if (validUsers.contains(i)) {
        ret.add(i);
      }
    }
    for (int i = 0; i < ret.length; i++) {
      ret[i] = getUsername(ret[i])!.id;
    }
    return ret;
  }

  String userIDsToString(List<String> userIDs) {
    String ret = '';
    for (int i = 0; i < userIDs.length; i++) {
      ret += userIDs[i];
      if ((i + 1) != userIDs.length) {
        ret += ',';
      }
    }
    return ret;
  }
}

final currentUserIDProvider = StateProvider<String>((ref) {
  return 'user-001';
});
