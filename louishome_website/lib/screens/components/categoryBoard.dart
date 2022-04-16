import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louishome_website/controller/main_hover_controller.dart';

class CategoryBoard extends StatelessWidget {
  CategoryBoard({Key? key}) : super(key: key);
  MainHoverController controller =
      Get.put<MainHoverController>(MainHoverController());
  @override
  Widget build(BuildContext context) {
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
