import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louishome_website/controller/shoppingcart_controller.dart';
import 'package:louishome_website/data/constants.dart';
import 'package:louishome_website/screens/components/bottomBar.dart';
import 'package:louishome_website/screens/components/restApi.dart';
import 'package:louishome_website/screens/components/topAppBar.dart';

class ShoppingCartScreen extends StatelessWidget {
  ShoppingCartScreen({Key? key}) : super(key: key);

  var httpApi = HttpApi();
  var shoppingcartController = Get.put(ShoppingCartController());
  var item = [];
  @override
  Widget build(BuildContext context) {
    httpApi.getShoppingCart({'u_id': '5'}).then(
      (value) => {
        print(value),
        if (value == 'empty')
          {shoppingcartController.setIsEmpty(true)}
        else
          {
            item = value,
            shoppingcartController.setIsEmpty(false),
            print(value is List),
          }
      },
    );
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: TopAppBar(
            child: CartForm(),
          ),
        ),
      ),
    );
  }

  Widget CartForm() {
    return Container(
      width: basicWidth,
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '장바구니',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(width: 20),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey,
                  ),
                  child: Center(
                    child: Text(
                      '0',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                SizedBox(width: 30),
                Text('item',
                    style: TextStyle(fontSize: 17, color: Colors.grey)),
                SizedBox(width: 400),
                Text('위시', style: TextStyle(fontSize: 17, color: Colors.grey)),
                SizedBox(width: 80),
                Text('수량', style: TextStyle(fontSize: 17, color: Colors.grey)),
                SizedBox(width: 80),
                Text('배송수단',
                    style: TextStyle(fontSize: 17, color: Colors.grey)),
                SizedBox(width: 80),
                Text('배송비', style: TextStyle(fontSize: 17, color: Colors.grey)),
                SizedBox(width: 150),
                Text('가격', style: TextStyle(fontSize: 17, color: Colors.grey)),
              ],
            ),
            Divider(),
            Obx(
              () => Visibility(
                visible: shoppingcartController.cartIsEmpty.value,
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    Center(
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.grey,
                        size: 50,
                      ),
                    ),
                    Center(child: Text('장바구니가 비었습니다.')),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
            // 만약 장바구니가 비어있지 않다면
            Obx(
              () => Visibility(
                visible: !shoppingcartController.cartIsEmpty.value,
                child: Column(
                  children: [
                    for (var i = 0; i < item.length; i++)
                      Container(
                        child: Row(
                          children: [
                            Text('${item[i]['p_id']} 번째 상품'),
                            SizedBox(width: 50),
                            Text('${item[i]['s_count']} 개'),
                            SizedBox(width: 50),
                            Text('이제 여기에 사진과 가격 등의 정보들을 채워넣으면 된다!'),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Divider(),
            SizedBox(height: 30),
            Center(
              child: InkWell(
                child: Text(
                  '계속 쇼핑하기',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                onTap: () {
                  Get.toNamed('/');
                },
              ),
            ),
            SizedBox(height: 150),
            Divider(),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
