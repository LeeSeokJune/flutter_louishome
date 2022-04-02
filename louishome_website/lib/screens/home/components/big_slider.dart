import 'package:card_swiper/card_swiper.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BigSlider extends StatelessWidget {
  BigSlider({Key? key}) : super(key: key);
  var colors = [Colors.yellow, Colors.green, Colors.black];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: 360,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.black,
        ),
      ),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: colors[index],
          );
        },
        itemCount: 3,
        autoplay: true,
        viewportFraction: 1,
        pagination: SwiperPagination(),
        control: SwiperControl(color: Colors.grey),
      ),
    );
  }
}
