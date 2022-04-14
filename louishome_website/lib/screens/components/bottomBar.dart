import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 30),
        Center(
          child: Container(
            width: 1320,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.arrow_upward_rounded),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '이용약관 | 개인정보처리방침',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '루이스홈',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Center(
          child: Container(
            width: 1320,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '법인명 : 스니프주식회사  |  대표이사 : 장재혁  |  사업자등록번호 : 583-87-02203',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '주소 : 서울특별시 마포구 백범로 16안길 9, 1층  |  대표전화 : 02-702-2779',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '통신판매업 : 2022-서울마포-00000호  | 개인정보책인자 : 장재혁',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '이메일 : sneefcompany@gmail.com',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 100),
      ],
    );
  }
}
