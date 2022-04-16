class User {
  String text1;

  User({required this.text1});

  factory User.fromString(Map<String, dynamic> text) {
    return User(text1: text["text"]);
  }
}
