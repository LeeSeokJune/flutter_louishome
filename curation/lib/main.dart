import 'package:curation/survey_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SurveyScreen(
        userData: {
          "name": "hi",
          "phoneNumber": "0101010",
          "pet": "강아지",
          "breed": "",
          "birthYear": "2021",
          "birthMonth": "1",
          "birthDay": "1",
          "sex": 0,
          "neu": 0,
          "weight": "0",
          "bcs": 0,
          "alg": [],
          "health": [],
          "petfood": [],
        },
      ),
    );
  }
}
