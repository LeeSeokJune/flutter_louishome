import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louishome_website/data/constants.dart';
import 'package:louishome_website/screens/components/bottomBar.dart';
import 'package:louishome_website/screens/components/topAppBar.dart';

class ShowPetfoodScreen extends StatelessWidget {
  ShowPetfoodScreen({Key? key}) : super(key: key);
  var petfood = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: TopAppBar(child: ShowPetfoodScreenWidget())),
    );
  }

  Widget ShowPetfoodScreenWidget() {
    print(petfood);
    print(Get.arguments);
    return Column(
      children: [
        PetfoodList(),
        SizedBox(height: 100),
        BottomBar(),
      ],
    );
  }

  Widget PetfoodList() {
    return Container(
      width: basicWidth,
      child: Wrap(
        children: [
          for (var i = 0; i < petfood.length; i++)
            Container(
              height: 200,
              width: 150,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 2),
                    blurRadius: 2.0,
                    spreadRadius: 2.0,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0, 0),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: line,
                  ),
                  Text('${petfood[i]['p_name']}'),
                  Text('${petfood[i]['p_brand']}'),
                  Text('${petfood[i]['p_ratail_price']}'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
