import 'dart:convert';

import 'package:http/http.dart';
import 'package:pixel_app/abstractions/iauth_service.dart';
import 'package:pixel_app/configs/httpservice_conf.dart';
import 'package:pixel_app/model/user.dart';
import 'package:pixel_app/service/base_api_service.dart';

class ApiAuthService extends BaseApiService implements IAuthService {
  
  @override
  Future<String> login(String username, String password) async {
    var uri = HttpServiceConfig.getApiUri('auth/login');
    Response response = await client.post(uri, body: { 
      'email': username,
      'password': password,
    });
    if(!isSuccess(response)){
      throw Exception("Could not login");
    }
    Map<String, dynamic> map = getMap(response);
    if(!map.containsKey("access_token")){
      throw Exception("Could not login");
    }

    return map['access_token'];
  }

  @override
  Future<User> createUser(User user) async {
    var uri = HttpServiceConfig.getApiUri("users/");
    var headers = {
      'Content-Type': 'application/json'
    };
    Response response = await client.post(
      uri, headers: headers,
      body: jsonEncode(user.toStringMap())
    );
    print(response.statusCode);
    if(!isSuccess(response)){
      
      throw Exception("Could not create user");
    }
    return User.fromMap(getMap(response));
  }
  
  @override
  Future<User> getUserById(int id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }
  
  @override
  Future<User> tokenVerify(String token) async {
    var uri = HttpServiceConfig.getApiUri("auth/profile");
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    Response response = await client.get(
      uri, headers: headers
    );
     print('current user');
    print(response.statusCode);
    if(!isSuccess(response)){
      throw Exception("Could not get current user");
    }
    return User.fromMap(getMap(response));
  }
  
  @override
  Future<bool> deleteUser(User user) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }
  
  @override
  Future<bool> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
