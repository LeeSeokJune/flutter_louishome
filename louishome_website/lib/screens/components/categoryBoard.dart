import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louishome_website/controller/category_controller.dart';

class CategoryBoard extends StatelessWidget {
  CategoryBoard({Key? key}) : super(key: key);
  final categoryController = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onHover: (value) {
          categoryController.onHoverBool(value);
        },
        onTap: () {},
        child: Container(
          width: 600,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HoverTextButton('사료', 0),
                    HoverTextButton('간식', 1),
                    HoverTextButton('영양제', 2),
                    HoverTextButton('장난감', 3),
                    HoverTextButton('목줄/리드줄/하네스', 4),
                    HoverTextButton('산책용품', 5),
                    HoverTextButton('미용/위생 용품', 6),
                    HoverTextButton('패션/의류', 7),
                    HoverTextButton('홈/리빙', 8),
                    HoverTextButton('이동장', 9),
                  ],
                ),
              ),
              Divider(),
              Visibility(
                visible: categoryController.getOnHover(),
                child: Container(
                  width: 1,
                  height: double.maxFinite,
                  color: Colors.black,
                ),
              ),
              SecondHoverContainer(
                  0, ['ALL', '건식', '습식', '자연식', '동결건조/에어드라이', '처방식', '토퍼/믹서']),
              SecondHoverContainer(1, [
                '저키/육포',
                '불리스틱/뼈 간식',
                '껌/덴탈',
                '에어드라이/동결건조',
                '비스켓/쿠키',
                '훈련용 간식',
                '부드러운 간식',
                '스틱(츄르)',
                '캔/파우치',
                '수제간식',
                '음료/우유',
                '보양식/죽',
                '베이커리',
                '통살'
              ]),
              SecondHoverContainer(2, [
                '눈 건강',
                '치아 건강',
                '관절/뼈 건강',
                '장/소화/유산균',
                '신장/요로',
                '심장',
                '면역/진정',
                '비타민',
                '해충방지',
                '종합영양제'
              ]),
              SecondHoverContainer(3, [
                '인형(바스락/삑삑)',
                '노즈워크/트릿볼',
                '공/원반',
                '실타래/로프/터그',
                '고무/라텍스',
                '오뚜기'
              ]),
              SecondHoverContainer(4, ['목줄', '하네스', '리드줄']),
              SecondHoverContainer(5, ['물통', '배변봉투', '인식표', '라이트', '입마개']),
              SecondHoverContainer(6, [
                '샴푸',
                '치약/칫솔',
                '눈세정제',
                '귀세정제',
                '에센스/미스트',
                '빗/브러쉬',
                '수건',
                '드라이기/드라이룸'
              ]),
              SecondHoverContainer(7, [
                '티셔츠',
                '민소매',
                '원피스',
                '아우터',
                '올인원',
                '모자/스카프',
                '양말/신발',
                '악세서리'
              ]),
              SecondHoverContainer(8, [
                '쿠션',
                '담요',
                '침대',
                '울타리/펜스',
                '급식기/급수기',
                '디퓨저/방향제',
                '청소용품',
                '홈 CCTV'
              ]),
              SecondHoverContainer(
                  9, ['켄넬', '백팩', '슬링백', '크로스백', '유모차', '차량용']),
            ],
          ),
        ),
      ),
    );
  }

  Widget SecondHoverContainer(int index, var list) {
    return Visibility(
      visible: categoryController.onHoverIndexBool[index],
      child: InkWell(
        child: Column(
          children: [
            SizedBox(height: index * 50),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (String str in list) SecondTextButton(str, index),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget SecondTextButton(String mainText, int index) {
    return InkWell(
      onHover: (value) {
        categoryController.setHoverBool(true);
        categoryController.setHoverIndexBool(value, index);
      },
      onTap: () {},
      child: Container(
        width: 300,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10,
          ),
          child: Text(
            '$mainText',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget HoverTextButton(String maintext, int index) {
    return Obx(
      () => InkWell(
        onHover: (value) {
          categoryController.setHoverIndexBool(value, index);
        },
        onTap: () {},
        child: Container(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10,
            ),
            child: Text(
              '$maintext',
              style: TextStyle(
                fontSize: 20,
                color: categoryController.onHoverIndexBool[index]
                    ? Colors.red
                    : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
