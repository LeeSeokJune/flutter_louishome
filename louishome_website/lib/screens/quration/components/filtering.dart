import 'package:get/get.dart';
import 'package:louishome_website/controller/quration_controller.dart';
import 'package:louishome_website/data/qurationData.dart';

class Filtering {
  var qurationController = Get.put(QurationController());

  List filteringSize(List petfood) {
    print(petfood.length);
    var filteredData = [];
    // 강아지 종의 size 부터 검색
    for (var data in dogBreed) {
      if (qurationController.quration.value.breed == data['breed']) {
        if (data['size'] == '대형견' || data['size'] == '대형견(초)') {
          qurationController.quration.value.size = '대형';
        } else if (data['size'] == '중형견') {
          qurationController.quration.value.size = '중형';
        } else if (data['size'] == '소형견' || data['size'] == '소형견(초)') {
          qurationController.quration.value.size = '소형';
        }
      }
    }
    for (var row in petfood) {
      if (row['p_small_category1']
              .contains(qurationController.quration.value.size) ||
          row['p_small_category1'].contains('무관')) {
        filteredData.add(row);
      }
    }
    print(filteredData.length);
    return filteredData;
  }

  List filteringAge(petfood) {
    var filteredData = [];
    calGas();

    if (qurationController.quration.value.gas == 'G(3~)') {
      for (var row in petfood) {
        if (row['p_small_category2']
                .contains(qurationController.quration.value.gas) ||
            row['p_small_category2'].contains('무관')) {
          filteredData.add(row);
        }
      }
    } else {
      for (var row in petfood) {
        if (row['p_small_category2']
                .contains(qurationController.quration.value.gas) ||
            row['p_small_category2'].contains('무관')) {
          filteredData.add(row);
        }
      }
    }
    print(filteredData.length);
    return filteredData;
  }

  List filteringDiet(var petfood) {
    var filteredData = [];

    if (qurationController.quration.value.bcs == '2' ||
        qurationController.quration.value.healthList.contains('다이어트')) {
      for (var row in petfood) {
        if (row['p_small_category6'][0] == '1') {
          filteredData.add(row);
        }
      }
    } else {
      for (var row in petfood) {
        if (row['p_small_category6'][0] == '0') {
          filteredData.add(row);
        }
      }
    }
    print(filteredData.length);
    return filteredData;
  }

  List filteringAlg(var petfood) {
    var filteredData = [];
    if (qurationController.quration.value.algList.contains('잘 모르겠어요')) {
      for (var row in petfood) {
        if (row['p_small_category7'][0] == '1') {}
      }
    } else {
      for (var row in petfood) {
        var flag = true;
        for (var alg in qurationController.algList) {
          if (row['p_small_category3'].contains(alg)) {
            flag = false;
          }
        }
        if (flag) {
          filteredData.add(row);
        }
      }
    }
    print(filteredData.length);
    return filteredData;
  }

  List filteringHealth(var petfood) {
    var filteredData = [];
    for (var row in petfood) {
      row['cnt'] = 0;
      row['cntS'] = 0;
    }
    if ((qurationController.healthList.contains('다이어트') &&
            qurationController.healthList.length == 1) ||
        qurationController.healthList.length < 1) {
      return petfood;
    } else {
      for (var row in petfood) {
        for (var health in qurationController.healthList) {
          if (row['p_small_category4'].contains(health + '(S)')) {
            row['cnt'] += 1;
            row['cntS'] += 1;
          }
          if (row['p_small_category4'].contains(health)) {
            row['cnt'] += 1;
          }
        }
      }
      for (var row in petfood) {
        if (row['cnt'] > 0) {
          filteredData.add(row);
        }
      }
    }
    filteredData.sort(((a, b) => b['cnt'].compareTo(a['cnt'])));
    print(filteredData.length);
    return filteredData;
  }

  int calMonth(String date) {
    var toDay = DateTime.now();
    int diff =
        int.parse(toDay.difference(DateTime.parse(date)).inDays.toString());
    return diff ~/ 30 + 1;
  }

  dynamic calGas() {
    var months = calMonth(qurationController.calBirth());
    if (qurationController.quration.value.pet == '고양이') {
      if (months < 3) {
        qurationController.quration.value.gas = 'G';
      } else if (months < 13) {
        qurationController.quration.value.gas = 'G(3~)';
      } else if (months < 73) {
        qurationController.quration.value.gas = 'A';
      } else {
        qurationController.quration.value.gas = 'S';
      }
    } else {
      if (qurationController.quration.value.size == '소형' ||
          qurationController.quration.value.size == '중형') {
        if (months < 13) {
          qurationController.quration.value.gas = 'G';
        } else if (months < 73) {
          qurationController.quration.value.gas = 'A';
        } else {
          qurationController.quration.value.gas = 'S';
        }
      } else {
        if (months < 17) {
          qurationController.quration.value.gas = 'G';
        } else if (months < 61) {
          qurationController.quration.value.gas = 'A';
        } else {
          qurationController.quration.value.gas = 'S';
        }
      }
    }
  }
}
