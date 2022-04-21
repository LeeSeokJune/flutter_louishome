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
    if (value == false) {
      Future.delayed(Duration(seconds: 1));
    } else {
      onHoverBool(value);
    }
  }

  void setHoverIndexBool(bool value, int index) {
    onHoverIndexBool[index] = value;
    print(onHoverIndexBool);
  }

  bool getOnHover() {
    return onHoverIndexBool.contains(true);
  }
}
