import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louishome_website/controller/main_hover_controller.dart';
import 'package:louishome_website/screens/components/bottomBar.dart';
import 'package:louishome_website/screens/components/restApi.dart';

import 'package:louishome_website/screens/components/topAppBar.dart';
import 'package:louishome_website/screens/home/components/best_product.dart';
import 'package:louishome_website/screens/home/components/big_slider.dart';
import 'package:louishome_website/screens/home/components/curation_explain.dart';
import 'package:louishome_website/screens/home/components/exhibition.dart';
import 'package:louishome_website/screens/home/components/instagram.dart';
import 'package:louishome_website/screens/home/components/products_slider.dart';
import 'package:louishome_website/screens/home/components/slider_4products.dart';

class HomeScreen extends GetView<MainHoverController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [TopAppBar(children: HomeScreenWidget())],
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

  Widget CatergoryHoverBoard(BuildContext context) {
    return Center(
      child: InkWell(
        onHover: (value) {
          controller.setHoverBool(value);
        },
        child: Container(
          width: context.width,
          height: 450,
          color: Colors.white,
          child: Center(
            child: Container(
              width: 1320,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextButtonBold('강아지'),
                      SizedBox(height: 10),
                      CustomTextButtom('사료'),
                      SizedBox(height: 10),
                      CustomTextButtom('간식'),
                      SizedBox(height: 10),
                      CustomTextButtom('영양제'),
                      SizedBox(height: 10),
                      CustomTextButtom('장난감'),
                      SizedBox(height: 10),
                      CustomTextButtom('목줄/리드줄/하네스'),
                      SizedBox(height: 10),
                      CustomTextButtom('산책용품'),
                      SizedBox(height: 10),
                      CustomTextButtom('미용/위생용품'),
                      SizedBox(height: 10),
                      CustomTextButtom('패션/의류'),
                      SizedBox(height: 10),
                      CustomTextButtom('홈/리빙'),
                      SizedBox(height: 10),
                      CustomTextButtom('이동장'),
                    ],
                  ),
                  SizedBox(width: 120),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextButtonBold('고양이'),
                      SizedBox(height: 10),
                      CustomTextButtom('사료'),
                      SizedBox(height: 10),
                      CustomTextButtom('간식'),
                      SizedBox(height: 10),
                      CustomTextButtom('영양제'),
                      SizedBox(height: 10),
                      CustomTextButtom('장난감'),
                      SizedBox(height: 10),
                      CustomTextButtom('미용/위생용품'),
                      SizedBox(height: 10),
                      CustomTextButtom('하네스'),
                      SizedBox(height: 10),
                      CustomTextButtom('패션/의류'),
                      SizedBox(height: 10),
                      CustomTextButtom('홈/리빙'),
                      SizedBox(height: 10),
                      CustomTextButtom('이동장'),
                    ],
                  ),
                  SizedBox(width: 120),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextButtonBold('베스트'),
                      SizedBox(height: 10),
                      CustomTextButtom('이달의 베스트'),
                      SizedBox(height: 10),
                      CustomTextButtom('주간 베스트'),
                    ],
                  ),
                  SizedBox(width: 120),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextButtonBold('신상품'),
                      SizedBox(height: 10),
                      CustomTextButtom('NOTICE'),
                      SizedBox(height: 10),
                      CustomTextButtom('Q&A'),
                      SizedBox(height: 10),
                      CustomTextButtom('EVENT'),
                      SizedBox(height: 10),
                      CustomTextButtom('REVIEW'),
                    ],
                  ),
                  SizedBox(width: 120),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextButtonBold('특가'),
                    ],
                  ),
                  SizedBox(width: 120),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextButtonBold('스타터'),
                    ],
                  ),
                  SizedBox(width: 120),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomTextButtonBold('루이존'),
                      SizedBox(height: 10),
                      CustomTextButtom('연령'),
                      SizedBox(height: 10),
                      CustomTextButtom('건강 사항'),
                      SizedBox(height: 10),
                      CustomTextButtom('간식 모음전'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget CustomTextButtonBold(String text) {
    return TextButton(
      child: Text(
        '$text',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {},
    );
  }

  Widget CustomTextButtom(String text) {
    return TextButton(
      child: Text(
        '$text',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      onPressed: () {},
    );
  }
}
