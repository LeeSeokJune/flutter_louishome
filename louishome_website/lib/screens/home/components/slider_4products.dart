import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class Slider4Products extends StatelessWidget {
  String mainText;
  String subText;
  Slider4Products({Key? key, required this.mainText, required this.subText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1320,
      child: Column(
        children: [
          Text(
            '$mainText',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '$subText',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 500,
                height: 500,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        child: Image.asset('images/petfood/$index.png'));
                  },
                  itemCount: 3,
                  autoplay: true,
                  viewportFraction: 1,
                  pagination: SwiperPagination(),
                  control: SwiperControl(color: Colors.grey),
                ),
              ),
              SizedBox(width: 50),
              Container(
                width: 500,
                height: 500,
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => Container(
                    width: 220,
                    height: 220,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.1, color: Colors.grey),
                    ),
                    child: Image.asset('images/petfood/$index.png'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          TextButton(
              child: Text('MORE', style: TextStyle(color: Colors.black)),
              onPressed: () {}),
        ],
      ),
    );
  }
}
