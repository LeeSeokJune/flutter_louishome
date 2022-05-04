import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:louishome_website/models/user.dart';

class UserController extends GetxController {
  var user = User(u_strid: 'id', u_pw: 'password', u_name: '이름').obs;
  var formKey = GlobalKey<FormState>().obs;

  void getUser(var data) {
    user.value.u_id = data['u_id'];
    user.value.u_strid = data['u_strid'];
    user.value.u_pw = data['u_pw'];
    user.value.u_name = data['u_name'];
  }
}
