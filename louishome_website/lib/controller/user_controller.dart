import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:louishome_website/models/user.dart';

class UserController extends GetxController {
  var user = User(id: 'id', password: 'password', name: '이름').obs;
  var formKey = GlobalKey<FormState>().obs;

  void getUser(var data) {
    user.value.pk = data['id'];
    user.value.id = data['u_id'];
    user.value.password = data['u_pw'];
    user.value.name = data['u_name'];
  }
}
