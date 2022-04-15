import 'package:get/get.dart';
import 'package:louishome_website/controller/main_hover_controller.dart';
import 'package:louishome_website/controller/product_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController(), permanent: true);
    Get.put(MainHoverController());
  }
}
