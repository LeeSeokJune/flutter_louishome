import 'package:flutter/material.dart';
import 'package:louishome_website/screens/components/bottomBar.dart';

import '../screens/components/topAppBar.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
        SSOButton(),
        SizedBox(height: 100),
        BottomBar(),
      ],
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
