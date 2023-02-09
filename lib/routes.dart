import 'package:flutter/material.dart';
import 'package:pixel_app/abstractions/iauth_service.dart';
import 'package:pixel_app/abstractions/icategory_service.dart';
import 'package:pixel_app/abstractions/ilocalstorage_service.dart';
import 'package:pixel_app/abstractions/iproduct_service.dart';
import 'package:pixel_app/page/createProduct.dart';
import 'package:pixel_app/page/error.dart';
import 'package:pixel_app/page/get_started.dart';
import 'package:pixel_app/page/home.dart';
import 'package:pixel_app/page/product.dart';
import 'package:pixel_app/page/login.dart';
import 'package:pixel_app/page/policy.dart';
import 'package:pixel_app/page/profile_confirm.dart';
import 'package:pixel_app/page/profile_dob.dart';
import 'package:pixel_app/page/profile_name.dart';
import 'package:pixel_app/page/profile_pic.dart';
import 'package:pixel_app/page/profile_settings.dart';
import 'package:pixel_app/page/signup.dart';
import 'package:pixel_app/page/error.dart';
import 'package:pixel_app/providers/user_session.dart';
import 'package:pixel_app/service/api_auth_service.dart';
import 'package:pixel_app/service/api_category_service.dart';
import 'package:pixel_app/service/api_file_service.dart';
import 'package:pixel_app/service/api_product_service.dart';
import 'package:pixel_app/service/local_storage.dart';
import 'package:pixel_app/service/sp_auth_service.dart';
import 'package:provider/provider.dart';
import 'abstractions/Ifile_action_service.dart';
import 'main.dart';
import 'model/user.dart';

enum Routes {
  getStarted,
  login,
  signup,
  policy,
  profileName,
  oops,
  profileDob,
  profilePic,
  done,
  home,
  product,
  settings,
  createProduct
}

getPageArgument<T>(BuildContext context) {
  return ModalRoute.of(context)!.settings.arguments as T;
}

getRouteMaps(
    {required IAuthService authService,
    required ILocalStorage localStorage,
    required ICategoryService categoryService,
    required IProductService productService}) {
  return {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/': (context) => const MyHomePage(
          title: 'Pixel',
        ),
    // When navigating to the "/second" route, build the SecondScreen widget.
    '/${Routes.getStarted.name}': (context) =>
        GetStarted(localStorage: localStorage),
    '/${Routes.login.name}': (context) =>
        Login(authService: authService, localStorage: localStorage),
    '/${Routes.signup.name}': (context) => Signup(authService: authService),
    '/${Routes.policy.name}': (context) => Policy(),
    '/${Routes.profileName.name}': (context) => ProfileName(),
    '/${Routes.oops.name}': (context) => Error(),
    '/${Routes.profileDob.name}': (context) => ProfileDob(),
    '/${Routes.profilePic.name}': (context) => ProfilePic(),
    '/${Routes.done.name}': (context) => ProfileConfirm(),
    '/${Routes.home.name}': (context) {
      User user = Provider.of<UserSession>(context, listen: false)
        .getUser();
      return Home(
        currentUser: user,
        categoryService: categoryService,
        productService: productService,
        localStorage: localStorage);
    },
    '/${Routes.product.name}': (context) {
      final args = getPageArgument<Map<String, int>>(context);
      return ProductPage(
          productId: args['productId'], productService: productService);
    },
    '/${Routes.settings.name}': (context){
      User user = Provider.of<UserSession>(context, listen: false)
        .getUser();
      return ProfileSettings(currentUser: user);
    },
    '/${Routes.createProduct.name}': (context) => CreateProduct(productService: productService,
     categoryService: categoryService),
  };
}
