import 'package:flutter/material.dart';

import 'home_page.dart';
import 'loading_screen.dart';
import 'Exception.dart';
import 'choose_location.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: '/',

      routes: {
  '/' : (context) => Loading(),
  '/home' : (context) => HomePage(),
  '/location': (context) => Location(),
  '/exception': (context) => Exception(),
  },

  debugShowCheckedModeBanner: false,
  theme: ThemeData(primarySwatch: Colors.teal),
  ));
}




