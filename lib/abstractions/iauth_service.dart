import '../model/user.dart';

abstract class IAuthService{
 Future<String> login(String username, String password);
 Future<User> createUser(User user);
 Future<bool> updateUser(User user);
 Future<bool> deleteUser(User user);
 Future<User> getUserById(int id);
 Future<User> tokenVerify(String token);
}