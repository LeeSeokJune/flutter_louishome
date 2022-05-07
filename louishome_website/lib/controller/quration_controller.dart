import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louishome_website/models/quration.dart';

class QurationController extends GetxController {
  var formKey = GlobalKey<FormState>().obs;
  var quration = Quration().obs;
  RxInt selectedSexId = 0.obs;
  RxInt selectedNeuId = 0.obs;
  RxInt selectedBcsId = 0.obs;
  RxBool isAlg = false.obs;
}
