import 'package:flutter/material.dart';
import 'package:louishome_website/screens/components/bottomBar.dart';
import 'package:louishome_website/screens/components/puppy_kitten.dart';
import 'package:louishome_website/screens/components/topAppBar.dart';

class StarterScreen extends StatelessWidget {
  const StarterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopAppBar(children: StartScreenWidget()),
          ],
        ),
      ),
    );
  }

  Widget StartScreenWidget() {
    return Column(
      children: [
        SizedBox(height: 80),
        PuppyKitten(),
        SizedBox(height: 300),
        BottomBar(),
      ],
    );
  }
}
