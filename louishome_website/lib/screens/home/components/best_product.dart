import 'package:flutter/material.dart';

class BestProduct extends StatelessWidget {
  const BestProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1320,
      child: Column(
        children: [
          Text(
            'Best Product',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 50),
          Container(
            width: 1320,
            height: 1200,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 15,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 2 / 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    width: 220,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.1, color: Colors.grey),
                    ),
                    child: Image.asset(
                      'images/petfood/$index.png',
                      height: 220,
                    ),
                  ),
                  Text('이름'),
                  Text('가격'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
