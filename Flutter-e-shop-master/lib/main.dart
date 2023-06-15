import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:onlineshop/Pages/SplashScreen.dart';
import 'package:onlineshop/Pages/login_page.dart';
import 'package:onlineshop/Pages/profile.dart';
import 'package:onlineshop/Pages/searchPage.dart';
import 'package:onlineshop/Pages/cart.dart';
import 'package:onlineshop/Pages/homePage.dart';
import 'package:onlineshop/WelcomePage.dart';
import 'package:onlineshop/components/Theme.dart';
import 'package:onlineshop/firebase_options.dart';

import 'package:onlineshop/utilities/sing_google.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(

  ));
}
bool isDarkMode = false;
class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: isDarkMode ? darkTheme : lightTheme,
      home: WelcomePage(),
      routes: {
        '/home': (context) => MyHomePage(),
        '/search': (context) => SearchPage(productTitle: 'Product1'),
        '/cart': (context) => cart(),
        '/profile': (context) => Profile(),
      },
    );
  }
}


