import 'dart:isolate';

import 'package:get/get.dart';

class ItemController extends GetxController {
  var itemList = [].obs;
  var petList = ['강아지', '고양이'].obs;
  var filteringList = [].obs;
  RxBool isLoading = true.obs;

  void setIsLoading(value) {
    isLoading(value);
  }

  void setItemList(value) {
    itemList(value);
    filteringList(value);
  }

  void filtering() {
    filteringList = [].obs;
    for (var row in itemList) {
      if (petList.contains(row['p_pet'])) {
        filteringList.add(row);
      }
    }
  }
}
