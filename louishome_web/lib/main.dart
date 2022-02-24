import 'package:flutter/material.dart';
import 'package:louishome_web/home/home_screen.dart';
import 'package:louishome_web/routes.dart';

void main() => runApp(LouisWeb());

class LouisWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: route,
    );
  }
}
