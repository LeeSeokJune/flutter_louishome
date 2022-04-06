import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:louishome_website/binding/init_binding.dart';
import 'package:louishome_website/screens/home/home_screen.dart';
import 'package:louishome_website/screens/product/product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/product/:id', page: () => ProductScreen())
      ],
      initialBinding: InitBinding(),
    );
  }
}
