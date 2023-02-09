import 'package:flutter/cupertino.dart';
import 'package:pixel_app/abstractions/iauth_service.dart';
import 'package:pixel_app/abstractions/ilocalstorage_service.dart';

import '../model/user.dart';

class UserSession extends ChangeNotifier {
  User? user;
  String? token;
  final IAuthService authService;
  final ILocalStorage localStorage;

  UserSession({required this.authService, required this.localStorage});

  
  loadSession({User? prefetchedUser, String? prefetchedToken}) async {
    user = prefetchedUser ?? await localStorage.getUser();
    token = prefetchedToken ?? await localStorage.getToken();

    if (user == null || token == null) {
      print("No User authentication found!");
      return;
    }
    notifyListeners();
  }

  Future<void> startSession(String token) async {
    await authService.tokenVerify(token).then((currentUser) {
      if (currentUser == null) {
        return;
      }

      localStorage.setToken(token);
      localStorage.setUser(currentUser);

      loadSession(prefetchedUser: currentUser, prefetchedToken: token);
    });
  }

  Future removeSession() async {
    await localStorage.removeUser();
    await localStorage.removeToken();
    user = null;
    token = null;
    notifyListeners();
  }

  isLoggedIn() {
    return token != null && user != null && user!.id! > 0;
  }

  getUser() {
    return user;
  }

  getToken() {
    return token;
  }
}
