import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:louishome_website/models/user.dart';

class UserController extends GetxController {
  var user = User(id: 'id', password: 'password').obs;
  var formKey = GlobalKey<FormState>().obs;
}
