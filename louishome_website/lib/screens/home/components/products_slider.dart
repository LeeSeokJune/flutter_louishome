import 'dart:html';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsSlider extends StatelessWidget {
  String mainText;
  String subText;
  ProductsSlider({Key? key, required this.mainText, required this.subText})
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
          SizedBox(height: 10),
          ConstrainedBox(
            child: Swiper(
              outer: false,
              itemBuilder: (c, i) {
                return Wrap(
                  runSpacing: 6.0,
                  children: [0, 1, 2, 3, 4, 5].map((i) {
                    return InkWell(
                        child: SizedBox(
                          width: 220,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(
                                child: Container(
                                  child: Image.asset("images/petfood/$i.png"),
                                ),
                                height: 220,
                                width: 220,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 6.0),
                                child: Column(
                                  children: [
                                    Text("아이템 이름"),
                                    Text('가격'),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Get.toNamed('/product/$i');
                        });
                  }).toList(),
                );
              },
              autoplay: true,
              itemCount: 10,
            ),
            constraints: BoxConstraints.loose(Size(1320, 300)),
          ),
        ],
      ),
    );
  }
}
