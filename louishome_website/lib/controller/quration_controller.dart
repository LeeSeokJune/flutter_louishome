import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louishome_website/models/quration.dart';

class QurationController extends GetxController {
  var formKey = GlobalKey<FormState>().obs;
  var quration = Quration().obs;
  RxInt selectedSexId = 0.obs;
  RxInt selectedNeuId = 0.obs;
  RxInt selectedBcsId = 0.obs;
  RxInt selectedPetId = 0.obs;
  RxInt isAlgButton = 1.obs;
  RxDouble weight = 0.0.obs;
  RxString selectedBirthYear = '2021'.obs;
  RxString selectedBirthMonth = '1'.obs;
  RxString selectedBirthDay = '1'.obs;
  RxString selectedBreed = ''.obs;
  RxList algList = [].obs;
  RxList healthList = [].obs;
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
