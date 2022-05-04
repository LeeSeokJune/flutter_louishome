import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louishome_website/controller/user_controller.dart';
import 'package:louishome_website/data/constants.dart';
import 'package:louishome_website/screens/components/bottomBar.dart';
import 'package:louishome_website/screens/components/restApi.dart';

import '../screens/components/topAppBar.dart';

class RegisterScreen extends StatelessWidget {
  var httpApi = HttpApi();
  RegisterScreen({Key? key}) : super(key: key);
  var userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          TopAppBar(
            child: ResgisterScreenWidget(),
          ),
        ]),
      ),
    );
  }

  Widget ResgisterScreenWidget() {
    return Column(
      children: [
        SizedBox(height: 100),
        Text(
          '회원 가입',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 100),
        RegisterInputField(),
        SizedBox(height: 50),
        SSOButton(),
        SizedBox(height: 100),
        BottomBar(),
      ],
    );
  }

  Widget RegisterInputField() {
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
                userController.user.value.u_strid = value!;
              },
            ),
          ),
          Container(
            width: 400,
            height: 50,
            child: TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                disabledBorder: _buildOutLineInputBorder(),
                enabledBorder: _buildOutLineInputBorder(),
                focusedBorder: _buildOutLineInputBorder(),
                hintText: '이름을 입력해주세요.',
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                contentPadding: EdgeInsets.only(top: 1, left: 10),
              ),
              onSaved: (value) {
                userController.user.value.u_name = value!;
              },
            ),
          ),
          Container(
            width: 400,
            height: 50,
            child: TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                disabledBorder: _buildOutLineInputBorder(),
                enabledBorder: _buildOutLineInputBorder(),
                focusedBorder: _buildOutLineInputBorder(),
                hintText: '패스워드를 입력해주세요',
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                contentPadding: EdgeInsets.only(top: 1, left: 10),
              ),
              onSaved: (value) {
                userController.user.value.u_pw = value!;
              },
            ),
          ),
          Container(
            width: 400,
            height: 50,
            child: TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                disabledBorder: _buildOutLineInputBorder(),
                enabledBorder: _buildOutLineInputBorder(),
                focusedBorder: _buildOutLineInputBorder(),
                hintText: '패스워드 확인',
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                contentPadding: EdgeInsets.only(top: 1, left: 10),
              ),
              // onSaved: (value) {
              //   userController.user.value.id = value!;
              // },
            ),
          ),
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
                  '회원 가입',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            onTap: () {
              userController.formKey.value.currentState!.save();

              httpApi.registerUser({
                'u_strid': userController.user.value.u_strid,
                'u_pw': userController.user.value.u_pw,
                'u_name': userController.user.value.u_name,
              }).then(
                (value) {
                  if (value == 'done') {
                    Get.toNamed('/login');
                  } else {
                    Get.snackbar('회원가입 실패', '이미 존재하는 아이디 입니다.');
                  }
                },
              );

              // httpApi.registerUser(userController.user);
            },
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _buildOutLineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: louisColor,
        width: 2,
      ),
    );
  }

  Widget SSOButton() {
    return Column(
      children: [
        Container(
          width: 400,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(child: Text('카카오톡으로 시작하기')),
        ),
        SizedBox(height: 10),
        Container(
          width: 400,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              '네이버로 시작하기',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: 400,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
              child: Text(
            '구글로 시작하기',
            style: TextStyle(color: Colors.white),
          )),
        ),
      ],
    );
  }
}
