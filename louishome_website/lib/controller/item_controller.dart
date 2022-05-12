import 'package:get/get.dart';
import 'package:louishome_website/data/qurationData.dart';

class ItemController extends GetxController {
  var itemList = [].obs;
  var petList = ['강아지', '고양이'].obs;
  var algList = [].obs;
  var filteringList = [].obs;
  var algButtons = alg.obs;
  RxBool isLoading = true.obs;

  void setIsLoading(value) {
    isLoading(value);
  }

  void setItemList(value) {
    itemList(value);
    filteringList(value);
  }

  void filtering() {
    var temp = [].obs;
    filteringList = [].obs;
    for (var row in itemList) {
      if (petList.contains(row['p_pet'])) {
        temp.add(row);
      }
    }
    if (petList.contains('강아지') && petList.contains('고양이')) {
      algButtons(alg);
    } else if (petList.contains('강아지')) {
      algButtons(dogAlg);
    } else {
      algButtons(catAlg);
    }

    for (var row in temp) {
      var flag = true;
      for (var alg in algList) {
        if (row['p_small_category3'].contains(alg)) {
          flag = false;
        }
      }
      if (flag == true) {
        filteringList.add(row);
      }
    }
    print(filteringList.length);
  }
}
