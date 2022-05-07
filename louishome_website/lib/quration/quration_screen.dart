import 'package:flutter/material.dart';
import 'package:louishome_website/screens/components/categoryBoard.dart';

class QurationScreen extends StatelessWidget {
  const QurationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoryBoard(),
    );
  }
}
