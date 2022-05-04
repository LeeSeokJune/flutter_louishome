import 'package:get/get.dart';

class ShoppingCartController extends GetxController {
  RxBool cartIsEmpty = true.obs;

  void setIsEmpty(value) {
    cartIsEmpty(value);
  }
}
