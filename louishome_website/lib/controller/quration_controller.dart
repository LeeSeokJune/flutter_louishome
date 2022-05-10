import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louishome_website/data/qurationData.dart';
import 'package:louishome_website/models/quration.dart';

class QurationController extends GetxController {
  var formKey = GlobalKey<FormState>().obs;
  var quration = Quration().obs;
  RxInt selectedSexId = 0.obs;
  RxInt selectedNeuId = 0.obs;
  RxInt selectedBcsId = 0.obs;
  RxInt selectedPetId = 0.obs;
  RxInt isAlgButton = 1.obs;
  RxString weight = '1'.obs;
  RxString selectedBirthYear = '2021'.obs;
  RxString selectedBirthMonth = '1'.obs;
  RxString selectedBirthDay = '1'.obs;
  RxString selectedBreed = ''.obs;
  RxList algList = [].obs;
  RxList healthList = [].obs;

  void setQurationData() {
    quration.value.pet = pet[selectedPetId.value];
    quration.value.bcs = selectedBcsId.value.toString();
    quration.value.birthYear = selectedBirthYear.value;
    quration.value.birthMonth = selectedBirthMonth.value;
    quration.value.birthDay = selectedBirthDay.value;
    quration.value.breed = selectedBreed.value;
    quration.value.algList = algList.toString();
    quration.value.healthList = healthList.toString();
    quration.value.neu = yn[selectedNeuId.value];
    quration.value.sex = sex[selectedSexId.value];
    quration.value.weight = weight.value;
    quration.value.sprotein = algList.contains('잘 모르겠어요') ? '1' : '0';
    quration.value.diet = healthList.contains('다이어트') ? '1' : '0';
  }

  String calBirth() {
    String data = quration.value.birthYear;
    if (quration.value.birthMonth.length == 1) {
      data += '0' + quration.value.birthMonth;
    } else {
      data += quration.value.birthMonth;
    }
    if (quration.value.birthDay.length == 1) {
      data += '0' + quration.value.birthDay;
    } else {
      data += quration.value.birthDay;
    }
    return data;
  }

  void setWeight(value) {
    weight(value);
  }

  void setAlgList(var value) {
    algList.contains(value) ? algList.remove(value) : algList.add(value);
  }

  bool containsAlg(var value) {
    return algList.contains(value);
  }

  void setQuration(var value) {
    quration(value);
    print(quration);
  }

  void setSelectedSexId(value) {
    selectedSexId(value);
  }

  void setSelectedPetId(value) {
    selectedPetId(value);
  }

  void setSelectedNeuId(value) {
    selectedNeuId(value);
  }

  void setSelectedBcsId(value) {
    selectedBcsId(value);
  }

  void setIsAlgButton(value) {
    isAlgButton(value);
  }

  void setSelectedBreed(value) {
    selectedBreed(value);
  }

  void setSelectedBirthYear(value) {
    selectedBirthYear(value);
  }

  void setSelectedBirthMonth(value) {
    selectedBirthMonth(value);
  }

  void setSelectedBirthDay(value) {
    selectedBirthDay(value);
  }
}
