import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sales_app/home.dart';
import 'package:sales_app/product_page.dart';
import 'package:sales_app/profile.dart';
import 'package:sales_app/visit_page.dart';

import 'customer_page.dart';
import 'login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({super.key,});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authentication',
      routes: {
        //"/": (_) => MyApp(),
        "/visitPage": (BuildContext context) => VisitPage(),
        "/profilePage": (BuildContext context) => ProfilePage(),
        "/customerPage": (BuildContext context) => CustomerPage(),
        "/productPage": (BuildContext context) => ProductPage(),
        "/loginPage" : (BuildContext context) => LoginPage()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 24.0,
            ),
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 46.0,
            color: Colors.blue.shade700,
            fontWeight: FontWeight.w500,
          ),
          bodyText1: TextStyle(fontSize: 18.0),
        ),
      ),
      home: LoginPage(),
    );
  }
}