import '../model/user.dart';

abstract class ILocalStorage{
 Future setToken(String token);

 Future<String> getToken();

 Future removeToken();

 Future setUser(User user);
 Future<User> getUser();
 Future removeUser();
}