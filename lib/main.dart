import 'package:flutter/material.dart';
import 'package:get_conf/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Conf app',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Color(0xFF1D1D27),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: HomePage(),
    );
  }
}
