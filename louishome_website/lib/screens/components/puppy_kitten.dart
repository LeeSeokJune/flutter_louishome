import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louishome_website/data/constants.dart';

class PuppyKitten extends StatelessWidget {
  const PuppyKitten({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: basicWidth,
      child: Column(
        children: [
          Text(
            '사료부터 용품까지',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            '성장기 반려동물을 위한 제품 모음전',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 80),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: Container(
                      width: 500,
                      height: 250,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Text('강아지 사진'),
                      ),
                    ),
                    onTap: () {
                      Get.toNamed('/puppy');
                    },
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    child: Text(
                      'PUPPY >',
                      style: TextStyle(fontSize: 30),
                    ),
                    onTap: () {
                      Get.toNamed('/puppy');
                    },
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 500,
                    child: Text(
                        '강아지를 입양 후 어떤 제품들을 준비해야할 지, 어떤 사료와 간식들을 먹여야할 지 고민된다면 함께하세요.'),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 500,
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Text('고양이 사진'),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'KITTEN >',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 500,
                    child:
                        Text('생활습관과 식습관이 시작되는 고양이 성장기, 루이스홈이 선별한 제품들을 만나보세요.'),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
