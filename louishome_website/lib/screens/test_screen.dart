import 'package:flutter/material.dart';
import 'package:louishome_website/screens/components/restApi.dart';

class TestScreen extends StatelessWidget {
  TestScreen({Key? key}) : super(key: key);
  var httpApi = HttpApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextButton(
          onPressed: () {
            httpApi.updateData({'asdf': 'aa'});
          },
          child: Text('patch button'),
        ),
        TextButton(
          onPressed: () {},
          child: Text('quration save button'),
        ),
        TextButton(
          onPressed: () {
            httpApi.buy({'aaa': 'aaa'});
          },
          child: Text('구매하기'),
        ),
      ],
    ));
  }
}
