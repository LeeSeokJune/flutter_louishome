import 'package:flutter/material.dart';
import 'package:louishome_website/screens/components/bottomBar.dart';

import 'package:louishome_website/screens/components/puppy_kitten.dart';
import 'package:get/get.dart';
import 'package:louishome_website/screens/components/topAppBar.dart';

class LouisZone extends StatelessWidget {
  const LouisZone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopAppBar(children: LouisZoneWidget(context)),
          ],
        ),
      ),
    );
  }

  Widget LouisZoneWidget(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 80),
        PuppyKitten(),
        SizedBox(height: 300),
        ExplainCare(),
        ExplainSnack(context),
        BottomBar(),
      ],
    );
  }

  Widget ExplainCare() {
    return Container(
      width: 1320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('아무거나 먹지 못하는', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text(
            '우리 반려동물에게 필요한 제품만 모았어요',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CareContainer('신장케어', '신장 건강을 위해 단백질과 인 등이 제한된 제품들만 모았어요'),
              CareContainer('췌장케어', '췌장염을 앓았던 아이들이 먹기에 부담스럽지 않은 저지방, 저단백 식품'),
              CareContainer('관절케어', '슬개골 탈구 및 관절이 약한 친구들을 위한 관절 강화에 도움이 되는 제품'),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CareContainer(
                  '다이어트/체중관리', '반려동물 건강에 가장 밀접한 체중, 사료부터 간식까지 저칼로리 위주로 만나보세요'),
              CareContainer(
                  '노령견/노령묘 케어', '활동량도 줄어 들고, 면역력이 떨어지는 우리 아이들을 위한 제품들을 만나보세요'),
            ],
          ),
        ],
      ),
    );
  }

  Widget CareContainer(String mainText, String subText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 350,
          height: 250,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        ),
        SizedBox(height: 20),
        Text(
          '$mainText',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 350,
          child: Text(
            '$subText',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  Widget ExplainSnack(BuildContext context) {
    return Container(
      width: context.width,
      height: 1100,
      decoration: BoxDecoration(color: Color.fromARGB(255, 210, 214, 205)),
      child: Column(
        children: [
          SizedBox(height: 200),
          Text(
            '혹시 이런 간식 찾고 계신가요?',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SnackContainer('저알러지', '비건 간식류 채소 야채 과일'),
              SizedBox(width: 50),
              SnackContainer('간식', '오래 먹는 간식'),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SnackContainer('간식', '부드러운 간식'),
              SizedBox(width: 50),
              SnackContainer('저알러지', '알러지 최소화 육류간식'),
            ],
          ),
        ],
      ),
    );
  }

  Widget SnackContainer(String mainText, String subText) {
    return Container(
      width: 500,
      height: 300,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 220),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              '$mainText',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '$subText',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
