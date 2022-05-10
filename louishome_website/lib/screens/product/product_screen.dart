import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louishome_website/controller/product_controller.dart';
import 'package:louishome_website/controller/review_controller.dart';
import 'package:louishome_website/data/constants.dart';

import 'package:louishome_website/data/petfood.dart';
import 'package:louishome_website/screens/components/bottomBar.dart';
import 'package:louishome_website/screens/components/topAppBar.dart';

import '../../controller/user_controller.dart';
import '../components/restApi.dart';

class ProductScreen extends GetView<ProductController> {
  ProductScreen({Key? key}) : super(key: key);
  var p_id = Get.parameters['id'];
  var httpApi = HttpApi();
  var itemData;
  var userController = Get.put(UserController());
  // var reviewController = Get.put(ReviewController());
  // var reviewList = [];
  @override
  Widget build(BuildContext context) {
    // httpApi.getReview(p_id!).then((value) {
    //   reviewList = value;
    //   if (reviewList.length > 0) {
    //     reviewController.setReviewVisible(true);
    //   }
    // });
    itemData = httpApi.getItem(p_id);
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            TopAppBar(child: ProductScreenWidget()),
          ],
        ),
      ),
    );
  }

  Widget ProductScreenWidget() {
    return Column(
      children: [
        Container(
          width: basicWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'images/petfood/$p_id.png',
                width: 600,
                height: 600,
              ),
              SizedBox(width: 100),
              ProductExplain(),
            ],
          ),
        ),
        // Review(),
        BottomBar(),
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
            petfood[int.parse(p_id!)]['이름'].toString(),
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                petfood[int.parse(p_id!)]['소매가'].toString() + '원',
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
                                    int.parse(petfood[int.parse(p_id!)]['소매가']!
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
                              int.parse(petfood[int.parse(p_id!)]['소매가']!
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
        InkWell(
            child: Container(
              width: 150,
              height: 40,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Center(
                child: Text(
                  '장바구니',
                ),
              ),
            ),
            onTap: () {
              httpApi.postShoppingCart({
                'p_id': p_id.toString(),
                'u_id': '5',
              });
            }),
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

//   Widget Review() {
//     return Form(
//       key: reviewController.formKey.value,
//       child: Container(
//         width: basicWidth,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text(
//                   '구매평',
//                   style: TextStyle(fontSize: 20),
//                 ),
//                 SizedBox(width: 20),
//                 Container(
//                   width: 20,
//                   height: 20,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100),
//                     color: Colors.grey,
//                   ),
//                   child: Center(
//                     child: Text(
//                       '0',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 30),
//             Container(
//               width: basicWidth - 200,
//               height: 50,
//               decoration: BoxDecoration(
//                 border: Border.all(color: louisColor),
//               ),
//               child: TextFormField(
//                 onSaved: (value) {
//                   reviewController.setContent(value);
//                 },
//               ),
//             ),
//             SizedBox(height: 30),
//             InkWell(
//               child: Container(
//                 width: 100,
//                 height: 30,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: louisColor),
//                 ),
//                 child: Center(
//                   child: Text('구매평 작성'),
//                 ),
//               ),
//               onTap: () {
//                 reviewController.formKey.value.currentState!.save();
//                 httpApi.postReview({
//                   'p_id': p_id,
//                   'u_id': '5',
//                   'r_title': 'asdf',
//                   'r_content': reviewController.content.value,
//                   'r_help': '0',
//                 }, p_id!);
//               },
//             ),
//             SizedBox(height: 30),
//             Obx(
//               () => Visibility(
//                 visible: reviewController.reviewVisible.value,
//                 child: Column(
//                   children: [
//                     for (var i = 0; i < reviewList.length; i++)
//                       Container(
//                         child: Row(
//                           children: [
//                             Text('${i + 1}번째 리뷰'),
//                             SizedBox(width: 20),
//                             Text("${reviewList[i]['r_content']}"),
//                             SizedBox(width: 20),
//                             Text("${reviewList[i]['r_date']}에 작성된 리뷰"),
//                           ],
//                         ),
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
}
