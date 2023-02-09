class User {
  int? id;
  String? username;
  String? name;
  String? password;
  String? avatar;

  User({
    this.id,
    this.username,
    this.name,
    this.password,
    this.avatar,
  });

  factory User.forAuth(String username, String password) {
    return User(username: username, password: password);
  }

  factory User.forCreate(
      String name, String username, String password, String avatar) {
    return User(
        name: name, username: username, password: password, avatar: avatar);
  }

  factory User.forUpdateName(int id, String name) {
    return User(id: id, name: name);
  }

  factory User.forUpdateDob(int id, String dob) {
    return User(id: id);
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map["id"] ?? 0,
      username: map["username"] ?? map["email"] ?? "",
      name: map["name"] ?? "",
      password: map["password"] ?? "",
      avatar: map["avatar"] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'username': username, 'name': name, 'avatar': avatar};
  }

  Map<String, String> toStringMap() {
    Map<String, String> data = {
      'id': '$id',
      'email': '$username',
      'name': '$name',
      'password': '$password',
      'avatar': '$avatar',
    };

    // data['id'] = 'asdasd';

    return data;
  }
}
