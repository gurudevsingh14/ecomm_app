import 'package:ecomm_app/Controllers/progressIndicator.dart';
import 'package:ecomm_app/View/Screens/LoginScreen/login_screen.dart';
import 'package:ecomm_app/View/Screens/SplashScreen/splash_screen.dart';
import 'package:ecomm_app/View/Screens/WelcomeScreen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProgressIndicatorController(),)
      ],
      child: MaterialApp(
        routes: {
          '/loginScreen' : (context) => LoginScreen(),
          '/welcomeScreen' : (context) => WelcomeScreen(),
        },
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}