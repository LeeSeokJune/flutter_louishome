import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  var formKey = GlobalKey<FormState>().obs;
  var content = ''.obs;
  RxBool reviewVisible = false.obs;

  void setContent(value) {
    content(value);
  }

  void setReviewVisible(value) {
    reviewVisible(value);
  }
}
