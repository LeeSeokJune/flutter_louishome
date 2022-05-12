import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louishome_website/controller/item_controller.dart';
import 'package:louishome_website/data/constants.dart';
import 'package:louishome_website/data/qurationData.dart';
import 'package:louishome_website/screens/components/bottomBar.dart';
import 'package:louishome_website/screens/components/restApi.dart';
import 'package:louishome_website/screens/components/topAppBar.dart';

class ItemScreen extends StatelessWidget {
  ItemScreen({Key? key}) : super(key: key);
  var itemController = Get.put(ItemController());
  var httpApi = HttpApi();

  @override
  Widget build(BuildContext context) {
    httpApi.getProducts().then((value) {
      itemController.setItemList(value);
      itemController.setIsLoading(false);
    });
    return Scaffold(
      body: SingleChildScrollView(child: TopAppBar(child: ItemScreenWidget())),
    );
  }

  Widget ItemScreenWidget() {
    return Column(
      children: [
        SizedBox(height: 100),
        Obx(
          () => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FilteringButtons(),
              SizedBox(width: 400),
              itemController.isLoading.value == true
                  ? CircularProgressIndicator()
                  : ShowItemList(),
              SizedBox(width: 200),
            ],
          ),
        ),
        SizedBox(height: 200),
        BottomBar(),
      ],
    );
  }

  Widget ShowItemList() {
    return Container(
      width: 800,
      child: Obx(
        () => Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (var row in itemController.filteringList)
              Container(
                width: 150,
                height: 200,
                decoration: line,
                child: Column(
                  children: [
                    Text('${row['p_name']}'),
                    Text('${row['p_pet']}'),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget FilteringButtons() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckBox(0, '강아지'),
          CheckBox(1, '고양이'),
          Divider(
            color: Colors.black,
          ),
          FilteringButtonsAlg(),
        ],
      ),
    );
  }

  Widget FilteringButtonsAlg() {
    return Container(
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('알러지 여부'),
            for (var i = 0; i < itemController.algButtons.length; i++)
              Row(
                children: [
                  InkWell(
                      child: Row(
                        children: [
                          Icon(
                            itemController.algList
                                    .contains(itemController.algButtons[i])
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: itemController.algList
                                    .contains(itemController.algButtons[i])
                                ? louisColor
                                : Colors.grey,
                          ),
                          Text('${itemController.algButtons[i]}'),
                        ],
                      ),
                      onTap: () {
                        itemController.algList
                                .contains(itemController.algButtons[i])
                            ? itemController.algList
                                .remove(itemController.algButtons[i])
                            : itemController.algList
                                .add(itemController.algButtons[i]);
                        itemController.filtering();
                      })
                ],
              )
          ],
        ),
      ),
    );
  }

  Widget CheckBox(int index, String name) {
    return InkWell(
        child: Row(
          children: [
            Icon(
              itemController.petList.contains(name)
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: itemController.petList.contains(name)
                  ? louisColor
                  : Colors.grey,
            ),
            Text('${name}'),
          ],
        ),
        onTap: () {
          itemController.petList.contains(name)
              ? itemController.petList.remove(name)
              : itemController.petList.add(name);
          itemController.filtering();
        });
  }
}
