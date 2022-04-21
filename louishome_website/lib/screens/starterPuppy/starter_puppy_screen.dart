import 'package:flutter/material.dart';
import 'package:louishome_website/data/constants.dart';
import 'package:louishome_website/screens/components/topAppBar.dart';

class StarterPuppyScreen extends StatelessWidget {
  const StarterPuppyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopAppBar(child: StarterPuppuyScreenWidget()),
          ],
        ),
      ),
    );
  }

  Widget StarterPuppuyScreenWidget() {
    return Column(
      children: [
        SizedBox(height: 50),
        Container(
          width: basicWidth,
          child: Column(
            children: [
              Container(
                width: basicWidth,
                height: 220,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Center(child: Text('루이사진')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
