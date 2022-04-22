import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxInt onHoverIndex = 0.obs;
  RxBool onHoverBool = false.obs;
  var onHoverIndexBool = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ].obs;
  final categoryKey = GlobalKey();

  void IndexedHover(var index) {
    onHoverIndex(index);
  }

  void setHoverBool(bool value) {
    onHoverBool(value);
  }

  void setHoverIndexBool(bool value, int index) {
    onHoverIndexBool[index] = value;
  }

  bool getOnHover() {
    return onHoverIndexBool.contains(true);
  }
}
