import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louishome_website/controller/user_controller.dart';
import 'package:louishome_website/data/constants.dart';
import 'package:louishome_website/screens/components/bottomBar.dart';

import '../screens/components/restApi.dart';
import '../screens/components/topAppBar.dart';

class LoginScreen extends StatelessWidget {
  var httpApi = HttpApi();
  LoginScreen({Key? key}) : super(key: key);
  var userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          TopAppBar(
            child: LoginScreenWidget(),
          ),
        ]),
      ),
    );
  }

  Widget LoginScreenWidget() {
    return Container(
      width: basicWidth,
      child: Column(
        children: [
          SizedBox(height: 100),
          LoginWidget(),
          SizedBox(height: 500),
          BottomBar(),
        ],
      ),
    );
  }

  Widget LoginWidget() {
    return Form(
      key: userController.formKey.value,
      child: Column(
        children: [
          Container(
            width: 400,
            height: 50,
            child: TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                disabledBorder: _buildOutLineInputBorder(),
                enabledBorder: _buildOutLineInputBorder(),
                focusedBorder: _buildOutLineInputBorder(),
                hintText: '아이디 또는 이메일을 입력해주세요.',
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                contentPadding: EdgeInsets.only(top: 1, left: 10),
              ),
              onSaved: (value) {
                userController.user.value.id = value!;
              },
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 400,
            height: 50,
            child: TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                disabledBorder: _buildOutLineInputBorder(),
                enabledBorder: _buildOutLineInputBorder(),
                focusedBorder: _buildOutLineInputBorder(),
                hintText: '비밀번호를 입력해주세요.',
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                contentPadding: EdgeInsets.only(top: 1, left: 10),
              ),
              onSaved: (value) {
                userController.user.value.password = value!;
              },
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            child: Container(
              width: 400,
              height: 50,
              decoration: BoxDecoration(
                color: louisColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  '로그인',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            onTap: () {
              userController.formKey.value.currentState!.save();
              httpApi.loginUser({
                'user_id': userController.user.value.id,
                'user_password': userController.user.value.password,
              }).then((value) {
                if (value == 'fail') {
                  Get.snackbar('로그인 실패', '아이디 혹은 비밀번호가 잘못되었습니다.');
                } else {
                  userController.user.value.loginBool = true;
                  Get.toNamed('/');
                }
              });
            },
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _buildOutLineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(0, 36, 79, 1),
        width: 2,
      ),
    );
  }
}
