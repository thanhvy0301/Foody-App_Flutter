class User{
  late String username;
  late String password;
  User({required this.username, required this.password});
  static List<User> init(){
    List<User> user = [
      User(
        username: "admin", 
        password: "admin")
    ];
    return user;
  }  
}