class User {
  String name;
  String email;
  String password;
  int id;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  User.autoIncrement({
    required this.name,
    required this.email,
    required this.password,
  }) : id = _nextId++;

  static int _nextId = 1;
}
