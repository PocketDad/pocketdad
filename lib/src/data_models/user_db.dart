class UserData {
  UserData(
    {
      required this.id,
      required this.name,
      required this.email,
      required this.username,
      this.dadName = "PocketDad",
      this.dadPic = "assets/images/dad1.JPG"
    }
  );
  String id;
  String name;
  String email;
  String username;
  String dadName;
  String dadPic; // default should be some random picture
}