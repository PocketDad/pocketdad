class UserData {
  UserData(
    {
      required this.id,
      required this.name,
      required this.email,
      required this.username,
      this.dadName = "PocketDad",
      this.dadPic = "assets/images/dad1.JPG"
    } // ask about setting unique
  );
  String id;
  String name;
  String email;
  String username;
  String dadName;
  String dadPic; // default should be some random picture
}

class UserDB {
  // change to var and use a loop(?)
  // currently using hard coded instances
  final List<UserData> _users = [
    UserData(
      id: 'user-001',
      name: 'John Doe',
      email: 'johndoe@gmail.com',
      username: 'johnnydoe',
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

  List<UserData> getAllusers(List<String> userIDs) {
    return _users.where((userData) => userIDs.contains(userData.id)).toList();
  }

}

UserDB userDB = UserDB();