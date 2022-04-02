import 'package:flutter/material.dart';
import 'package:louishome_website/screens/components/mainAppBar.dart';
import 'package:louishome_website/screens/home/components/big_slider.dart';
import 'package:louishome_website/screens/home/components/curation_explain.dart';
import 'package:louishome_website/screens/home/components/products_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainAppBar(),
            BigSlider(),
            SizedBox(height: 100),
            ProductsSlider(
              mainText: '베스트 상품',
              subText: '이번주 가장 인기있는 상품이에요',
            ),
            SizedBox(height: 100),
            CurationExplain(),
          ],
        ),
      ),
    );
  }
}
