import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louishome_website/controller/product_controller.dart';

import 'package:louishome_website/data/petfood.dart';
import 'package:louishome_website/screens/components/topAppBar.dart';

class ProductScreen extends GetView<ProductController> {
  ProductScreen({Key? key}) : super(key: key);
  var id = Get.parameters['id'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TopAppBar(children: ProductScreenWidget()),
          ],
        ),
      ),
    );
  }

  Widget ProductScreenWidget() {
    return Column(
      children: [
        Container(
          width: 1320,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/petfood/$id.png',
                width: 600,
                height: 600,
              ),
              SizedBox(width: 100),
              ProductExplain(),
            ],
          ),
        ),
      ],
    );
  }

  Widget ProductExplain() {
    return Container(
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            petfood[int.parse(id!)]['이름'].toString(),
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                petfood[int.parse(id!)]['소매가'].toString() + '원',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Icon(Icons.share),
            ],
          ),
          Divider(),
          Text('간단한 설명 칸'),
          SizedBox(height: 30),
          Row(
            children: [
              Text(
                '배송방법 ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('택배')
            ],
          ),
          Row(
            children: [
              Text(
                '배송비 ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('무료(50,000원 이상 무료배송)')
            ],
          ),
          SizedBox(height: 20),
          Container(
            width: 500,
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromARGB(31, 182, 182, 182),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: Text(
                    '수량',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 0.1,
                  indent: 15,
                  endIndent: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          InkWell(
                              child: Container(
                                height: 30,
                                width: 20,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                ),
                                child: Center(child: Text('-')),
                              ),
                              onTap: () {
                                controller.minusButton();
                              }),
                          Container(
                            child: Center(
                              child: Container(
                                height: 30,
                                width: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                ),
                                child: Center(
                                    child: Obx(
                                  () => Text(
                                      controller.productIndex.value.toString()),
                                )),
                              ),
                            ),
                          ),
                          InkWell(
                              child: Container(
                                height: 30,
                                width: 20,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                ),
                                child: Center(child: Text('+')),
                              ),
                              onTap: () {
                                controller.plusButton();
                              }),
                        ],
                      ),
                      Obx(
                        () => Text((controller.productIndex.value *
                                    int.parse(petfood[int.parse(id!)]['소매가']!
                                        .replaceAll(',', '')))
                                .toString() +
                            '원'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('총 상품금액(${controller.productIndex.value}개)'),
                Text(
                  (controller.productIndex.value *
                              int.parse(petfood[int.parse(id!)]['소매가']!
                                  .replaceAll(',', '')))
                          .toString() +
                      '원',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          _Buttons(),
        ],
      ),
    );
  }

  Widget _Buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 150,
          height: 40,
          decoration: BoxDecoration(color: Colors.brown),
          child: Center(
            child: Text(
              '구매하기',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          width: 150,
          height: 40,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Center(
            child: Text(
              '장바구니',
            ),
          ),
        ),
        Container(
          width: 150,
          height: 40,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite_border,
              ),
              Text(
                '   0',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
