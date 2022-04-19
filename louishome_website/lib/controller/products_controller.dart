import 'package:get/get.dart';
import 'package:louishome_website/screens/components/restApi.dart';

class ProductsController extends GetxController {
  var view = true.obs;
  var products = [].obs;
  HttpApi httpApi = HttpApi();

  dynamic getData() {
    view(true);
    httpApi.getProducts().then((value) => products(value));
    view(false);
    return products;
  }
}
