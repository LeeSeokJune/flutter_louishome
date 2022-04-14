import 'package:flutter/material.dart';
import 'package:louishome_website/screens/components/mainAppBar.dart';

class StarterPuppyScreen extends StatelessWidget {
  const StarterPuppyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainAppBar(),
            SizedBox(height: 50),
            Container(
              width: 1320,
              child: Column(
                children: [
                  Container(
                    width: 1320,
                    height: 220,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Center(child: Text('루이사진')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
