import 'package:flutter/material.dart';

class CurationExplain extends StatelessWidget {
  const CurationExplain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1320,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                '사료 정기구독 신청하고',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '다양한 혜택을 받아보세요',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              checkRoundText('사료 정기 구독 고객, 전 제품 5% 적립'),
              SizedBox(height: 20),
              checkRoundText('정기배송 상품 배송비 무료'),
              SizedBox(height: 20),
              checkRoundText('수수료 없이 사료 교체 및 구독 취소'),
            ],
          ),
          Image.asset(
            'images/petfood/test.png',
            width: 600,
          )
        ],
      ),
    );
  }

  Widget checkRoundText(String text) {
    return Row(
      children: [
        Icon(Icons.check_circle_outline, color: Colors.green),
        SizedBox(width: 15),
        Text('$text'),
      ],
    );
  }
}
