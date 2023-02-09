import 'dart:convert';
import 'dart:math';

import 'package:pixel_app/abstractions/iauth_service.dart';
import 'package:pixel_app/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class SharedPreferenceAuthService implements IAuthService{

  static const defaultUser = "defaultUser";
  static const defaultToken = "defaultToken";

  @override
  Future<String> login(String username, String password) async {
    User user = await getUserById(0);
    if(user.username != username || user.password != password){
      throw Exception("Username or password incorrect");
    }
    String newToken = const Uuid().v1();
    await writeToken(newToken);
    return newToken;
  }
  
  @override
  Future<User> createUser(User user) async {
    user.id = Random().nextInt(9999) + 1111;
    await writeObject<User>(defaultUser, user);
    return user;
  }

  Future writeToken(String token) async {
    (await getSpInstance())
      .setString(defaultToken, token);
  }

  Future<String> readToken() async {
    return (await getSpInstance())
      .getString(defaultToken) ?? "";    
  }

  /// Method to write an Object to shared preferences
  Future writeObject<Data>(String key, Data object) async {
    (await getSpInstance())
      .setString(key, jsonEncode(object));
  }

  /// Method to read an Object from shared preferences
  Future<Map<String, dynamic>> readObject(String key) async {
    return jsonDecode(
      (await getSpInstance())
        .getString(key) ?? "{}"
    );
  }

  Future<SharedPreferences> getSpInstance() async {
    return await SharedPreferences.getInstance();
  }
  
  @override
  Future<User> getUserById(int id) async {
    // Id will be ignored here as, the sp will save only one user at a time
    Map<String, dynamic> object = await readObject(defaultUser);
    if(object == null){
      throw Exception("Default user not found");
    }
    return User.fromMap(object);
  }
  
  @override
  Future<User> tokenVerify(String token) async {
    String savedToken = await readToken();
    if(savedToken == null || savedToken != token){
      throw Exception("Token expired");
    }

    return await getUserById(0);
  }
  
  @override
  Future<bool> deleteUser(User user) async {
    return await (await getSpInstance())
      .remove(defaultUser);
  }
  
  @override
  Future<bool> updateUser(User user) async {
    await writeObject<User>(defaultUser, user);
    return true;
  }

}