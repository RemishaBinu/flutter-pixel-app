import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider_android/path_provider_android.dart';
import 'package:pixel_app/abstractions/Ifile_action_service.dart';
import 'package:pixel_app/app_color_map.dart';
import 'package:pixel_app/page/splash.dart';
import 'package:pixel_app/providers/user_session.dart';
import 'package:pixel_app/routes.dart';
import 'package:pixel_app/service/api_auth_service.dart';
import 'package:pixel_app/service/api_category_service.dart';
import 'package:pixel_app/service/api_file_service.dart';
import 'package:pixel_app/service/api_product_service.dart';
import 'package:pixel_app/service/local_notification_progress_service.dart';
import 'package:pixel_app/service/local_storage.dart';
import 'package:provider/provider.dart';

import 'abstractions/iauth_service.dart';
import 'abstractions/icategory_service.dart';
import 'abstractions/ilocalstorage_service.dart';
import 'abstractions/iproduct_service.dart';

IAuthService authService = ApiAuthService();
ILocalStorage localStorage = new LocalStorage();
ICategoryService categoryService = new ApiCategoryService();
IProductService productService = new ApiProductService();

void main() {

  if (Platform.isAndroid) PathProviderAndroid.registerWith();

  LocalNotificationProgressService
    .getInstance()
    ..initialize()
    ..requestPermission();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserSession(
            localStorage: localStorage, authService: authService
          )..loadSession())
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pixel',
        theme: ThemeData(
          primarySwatch: MaterialColor(0xFF0070C1, appColorSwatch),
        ),
        initialRoute: '/',
        routes: getRouteMaps(
          authService:  authService,
          localStorage: localStorage,
          categoryService: categoryService,
          productService: productService
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5),
        () => Navigator.pushReplacementNamed(context, '/${Routes.getStarted.name}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blue, body: Splash());
  }
}
