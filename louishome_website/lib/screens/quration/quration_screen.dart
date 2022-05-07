import 'dart:js';
import 'package:flutter/material.dart';
import 'package:louishome_website/data/constants.dart';
import 'package:louishome_website/screens/components/bottomBar.dart';
import 'package:louishome_website/screens/components/topAppBar.dart';
import 'package:get/get.dart';

class QurationScreen extends StatelessWidget {
  const QurationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TopAppBar(child: QurationScreenWidget(context)),
    );
  }

  Widget QurationScreenWidget(BuildContext context) {
    return Container(
      height: context.height,
      child: ListView(
        children: [InputPet(), BottomBar()],
      ),
    );
  }

  Widget InputPet() {
    return Row(
      children: [
        selectButton(0),
      ],
    );
  }

  Widget selectButton(var index) {
    return Container(
      width: 100,
      height: 30,
      decoration: line,
    );
  }
}
