import 'dart:convert';

import 'package:pixel_app/abstractions/ilocalstorage_service.dart';
import 'package:pixel_app/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage implements ILocalStorage{
  static const defaultToken = "defaultToken";
  static const defaultUser = 'defaultUser';
  @override
  Future<String> getToken() async{
    return (await getSpInstance())
      .getString(defaultToken) ?? "";    
  }

  @override
  Future setToken(String token) async {
     (await getSpInstance())
      .setString(defaultToken, token);
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
  Future<User> getUser() async {
    Map<String, dynamic> object = await readObject(defaultUser);
    if(object == null){
      throw Exception("Default user not found");
    }
    return User.fromMap(object);
  }

  @override
  Future removeToken() async {
    return await (await getSpInstance())
      .remove(defaultToken);
  }

  @override
  Future removeUser() async {
    return await (await getSpInstance())
      .remove(defaultUser);
  }

  @override
  Future setUser(User user) async {
    await writeObject<Map<String, dynamic>>(defaultUser, user.toMap());
    return user;
  }
}