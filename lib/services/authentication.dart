import 'package:bloc_example_1/models/user.dart';
import 'package:hive/hive.dart';

class Authentication {
  late Box<User> _users;
  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _users = await Hive.openBox("usersBoxs");

    await _users.add(User("testuser1", "password"));
    await _users.add(User("testuser2", "password"));
  }

  Future<String?> authenticateUser(
      final String username, final String password) async {
    final success = await _users.values.any((element) =>
        element.username == username && element.password == password);

    if (success) {
      return username;
    } else {
      return null;
    }
  }
}
