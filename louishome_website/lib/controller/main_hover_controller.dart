import 'package:get/get.dart';

class MainHoverController extends GetxController {
  RxInt onHoverIndex = 0.obs;
  RxBool onHoverBool = false.obs;

  void IndexedHover(var index) {
    onHoverIndex(index);
  }

  void setHoverBool(var bool) {
    onHoverBool(bool);
  }
}
