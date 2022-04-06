import 'package:get/get.dart';

class ProductController extends GetxController {
  RxInt productIndex = 1.obs;

  void minusButton() {
    if (productIndex.value > 1) {
      productIndex.value--;
    }
  }

  void plusButton() {
    productIndex.value++;
  }
}
