import 'package:flutter/material.dart';
import 'package:louishome_web/home/components/item_list.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List upperData = ['회원가입', '로그인', '장바구니', '고객센터'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15),
                Container(
                  width: 1280,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text('   오프라인 매장 찾기'),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text('회원가입   '),
                            Container(
                                height: 15,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey))),
                            Text('   로그인   '),
                            Container(
                                height: 15,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey))),
                            Text('   장바구니   '),
                            Container(
                                height: 15,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey))),
                            Text('   고객센터   '),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'images/루이스홈 로고BLUE.png',
                  width: 95,
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 36, 79, 1),
                  ),
                  child: Center(
                    child: Container(
                      width: 1280,
                      child: Row(
                        children: [
                          Container(
                            width: 110,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 10),
                                Icon(Icons.menu, color: Colors.white),
                                Text(
                                  '카테고리',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 110,
                            child: Center(
                              child: Text(
                                '브랜드',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 110,
                            child: Center(
                              child: Text(
                                '베스트',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 110,
                            child: Center(
                              child: Text(
                                "루이's 추천",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            child: Center(
                              child: Text(
                                '신상품',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            child: Center(
                              child: Text(
                                '특가',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 250),
                          Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          Container(
                            width: 200,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                '검색어를 입력하세요.                                      ',
                                style:
                                    TextStyle(fontSize: 10, color: Colors.grey),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.assignment,
                            color: Colors.white,
                          ),
                          Text(
                            '맞춤형 사료추천',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 360,
                  width: MediaQuery.of(context).size.width < 1280
                      ? 1280
                      : MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Text('루이 사진', style: TextStyle(fontSize: 30)),
                  ),
                ),
                SizedBox(height: 50),
                ItemList(name: 'Weekly Best'),
                SizedBox(height: 100),
                ItemList(name: '따끈따끈 신상품'),
                SizedBox(height: 100),
                ItemList(name: '오늘 핫딜'),
                SizedBox(height: 100),
                ItemList(name: 'MD 추천'),
                SizedBox(height: 50),
                Container(
                  height: 210,
                  width: 1280,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      '시즌 기프트 프로모션',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                SizedBox(height: 100),
                ItemList(name: '우리 아이를 위한 프리미엄 사료 추천'),
                SizedBox(height: 50),
                Container(
                  height: 210,
                  width: 1280,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Text(
                      'For new puppy or kitten',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
