import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:louishome_website/binding/init_binding.dart';
import 'package:louishome_website/screens/home/home_screen.dart';
import 'package:louishome_website/screens/login/login_screen.dart';
import 'package:louishome_website/screens/louiszone/louiszone_screen.dart';
import 'package:louishome_website/screens/product/product_screen.dart';
import 'package:louishome_website/screens/quration/quration_screen.dart';
import 'package:louishome_website/screens/register/register_screen.dart';
import 'package:louishome_website/screens/shoppingCart/shoppingCart_screen.dart';
import 'package:louishome_website/screens/showPetfood/showPetfood_screen.dart';
import 'package:louishome_website/screens/starter/starter_screen.dart';
import 'package:louishome_website/screens/starterPuppy/starter_puppy_screen.dart';

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
        GetPage(name: '/product/:id', page: () => ProductScreen()),
        GetPage(name: '/shopping_cart', page: () => ShoppingCartScreen()),
        GetPage(name: '/starter', page: () => StarterScreen()),
        GetPage(name: '/puppy', page: () => StarterPuppyScreen()),
        GetPage(name: '/louiszone', page: () => LouisZone()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/quration', page: () => QurationScreen()),
        GetPage(name: '/showpetfood', page: () => ShowPetfoodScreen()),
      ],
      initialBinding: InitBinding(),
    );
  }
}
