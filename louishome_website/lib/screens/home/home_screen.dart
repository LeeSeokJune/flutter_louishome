import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louishome_website/controller/category_controller.dart';
import 'package:louishome_website/screens/components/bottomBar.dart';
import 'package:louishome_website/screens/components/topAppBar.dart';
import 'package:louishome_website/screens/home/components/best_product.dart';
import 'package:louishome_website/screens/home/components/big_slider.dart';
import 'package:louishome_website/screens/home/components/curation_explain.dart';
import 'package:louishome_website/screens/home/components/exhibition.dart';
import 'package:louishome_website/screens/home/components/instagram.dart';
import 'package:louishome_website/screens/home/components/products_slider.dart';
import 'package:louishome_website/screens/home/components/slider_4products.dart';

class HomeScreen extends StatelessWidget {
  final categoryController = Get.put(CategoryController());
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopAppBar(
              child: HomeScreenWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget HomeScreenWidget() {
    return Column(
      children: [
        BigSlider(),
        SizedBox(height: 100),
        CurationExplain(),
        SizedBox(height: 200),
        ProductsSlider(
          mainText: '따끈따끈 신상품',
          subText: '어떤 제품들이 루이스홈에 입고되었을까요?',
        ),
        SizedBox(height: 200),
        ProductsSlider(mainText: '오늘 핫딜', subText: '놓치면 후회할 가격'),
        SizedBox(height: 200),
        Slider4Products(mainText: 'MD 추천', subText: '특별한 날 이런 간식 어때요?'),
        SizedBox(height: 200),
        ProductsSlider(
            mainText: '루이의 장바구니', subText: '깐깐한 루사장님은 어떤 상품을 구매했을까요?'),
        Exhibition(),
        SizedBox(height: 100),
        BestProduct(),
        SizedBox(height: 200),
        Instagram(),
        BottomBar(),
      ],
    );
  }
}
