import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:html' as html;

class MainAppBar extends StatelessWidget {
  MainAppBar({Key? key}) : super(key: key);
  var pageName = ['NOTICE', '장바구니', '로그인', '회원가입'];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: context.width,
          height: 45,
          color: Color.fromRGBO(0, 36, 79, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '맞춤형 사료추천, 내 반려동물에게 딱 맞는 사료를 찾아보세요   ',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 15,
                ),
                onTap: () {
                  html.window.open('http://3.17.203.194/#/', '_self');
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
          child: Center(
            child: Container(
              width: 1320,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextButton('NOTICE'),
                  SizedBox(width: 15),
                  Container(height: 10, width: 1, color: Colors.grey),
                  SizedBox(width: 15),
                  CustomTextButton('장바구니'),
                  SizedBox(width: 15),
                  Container(height: 10, width: 1, color: Colors.grey),
                  SizedBox(width: 15),
                  CustomTextButton('로그인'),
                  SizedBox(width: 15),
                  Container(height: 10, width: 1, color: Colors.grey),
                  SizedBox(width: 15),
                  CustomTextButton('회원가입'),
                ],
              ),
            ),
          ),
        ),
        Divider(),
        Center(
          child: Container(
            width: 1320,
            child: Row(
              children: [
                SizedBox(width: 40),
                InkWell(
                  child: Image.asset(
                    'images/png/루이스홈_sg2_color.png',
                    width: 200,
                    height: 50,
                  ),
                  onTap: () {
                    Get.toNamed('/');
                  },
                ),
              ],
            ),
          ),
        ),
        Divider(),
        Center(child: Category()),
        Divider(),
      ],
    );
  }

  Widget CustomTextButton(String text) {
    return InkWell(
      child: Text(
        '$text',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 13,
        ),
      ),
      onTap: () {
        if (text == '장바구니') {
          Get.toNamed('/shopping_cart');
        }
      },
    );
  }

  Widget Category() {
    return Container(
      width: 1320,
      child: Row(
        children: [
          SizedBox(width: 50),
          InkWell(
            child: Row(
              children: [
                Icon(
                  Icons.menu,
                  size: 30,
                  color: Color.fromRGBO(0, 36, 79, 1),
                ),
                Text(
                  '카테고리',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            onTap: () {},
            onHover: (value) {
              print(value.toString());
            },
          ),
          SizedBox(width: 50),
          CategoryButton('강아지'),
          CategoryButton('고양이'),
          CategoryButton('베스트'),
          CategoryButton('신상품'),
          CategoryButton('특가'),
          CategoryButton('스타터'),
          CategoryButton('루이존'),
          SizedBox(width: 90),
          Container(
            width: 350,
            height: 30,
            child: TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                disabledBorder: _buildOutLineInputBorder(),
                enabledBorder: _buildOutLineInputBorder(),
                focusedBorder: _buildOutLineInputBorder(),
                hintText: '스타터 패키지 20% 할인',
                contentPadding: EdgeInsets.only(top: 1, left: 10),
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 5),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 36, 79, 1),
            ),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 50),
          Icon(
            Icons.star_border,
            size: 30,
            color: Color.fromRGBO(0, 36, 79, 1),
          ),
          SizedBox(width: 20),
          Icon(Icons.shopping_cart_outlined),
        ],
      ),
    );
  }

  OutlineInputBorder _buildOutLineInputBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
      color: Color.fromRGBO(0, 36, 79, 1),
      width: 2,
    ));
  }

  Widget CategoryButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextButton(
        child: Text(
          '$text',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        onPressed: () {
          if (text == '스타터') {
            Get.toNamed('/starter');
          } else if (text == '루이존') {
            Get.toNamed('/louiszone');
          }
        },
      ),
    );
  }
}
