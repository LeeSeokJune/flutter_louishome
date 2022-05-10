import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:louishome_website/controller/quration_controller.dart';
import 'package:louishome_website/data/constants.dart';
import 'package:louishome_website/data/qurationData.dart';
import 'package:louishome_website/screens/components/bottomBar.dart';
import 'package:louishome_website/screens/components/restApi.dart';
import 'package:louishome_website/screens/components/topAppBar.dart';
import 'package:get/get.dart';

import 'components/filtering.dart';

class QurationScreen extends StatelessWidget {
  QurationScreen({Key? key}) : super(key: key);
  var qurationController = Get.put(QurationController());
  var httpApi = HttpApi();
  var filtering;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: TopAppBar(child: QurationScreenWidget(context))),
    );
  }

  Widget QurationScreenWidget(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 100),
          InputForm(),
          BottomBar(),
        ],
      ),
    );
  }

  Widget InputForm() {
    return Form(
      key: qurationController.formKey.value,
      child: Container(
        width: basicWidth - 400,
        child: Column(
          children: [
            Row(
              children: [
                InputPet(),
                SizedBox(width: 100),
                InputBreed(),
              ],
            ),
            SizedBox(height: 50),
            InputBirth(),
            SizedBox(height: 50),
            Row(
              children: [
                InputSex(),
                SizedBox(width: 100),
                InputNeu(),
              ],
            ),
            SizedBox(height: 50),
            InputWeight(),
            SizedBox(height: 50),
            InputBcs(),
            SizedBox(height: 50),
            InputAlg(),
            SizedBox(height: 50),
            InputHealth(),
            SizedBox(height: 50),
            postButton(),
          ],
        ),
      ),
    );
  }

  Widget postButton() {
    return InkWell(
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            width: 4,
            color: louisColor,
          ),
        ),
        child: Center(
          child: Text(
            '사료 확인',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
      onTap: () {
        qurationController.formKey.value.currentState!.save();
        qurationController.setQurationData();
        httpApi.postQuration({
          'pet': qurationController.quration.value.pet,
          'breed': qurationController.quration.value.breed,
          'bcs': qurationController.quration.value.bcs,
          'birthYear': qurationController.quration.value.birthYear,
          'birthMonth': qurationController.quration.value.birthMonth,
          'birthDay': qurationController.quration.value.birthDay,
          'weight': qurationController.quration.value.weight,
          'sex': qurationController.quration.value.sex,
          'neu': qurationController.quration.value.neu,
          'alg': qurationController.quration.value.algList,
          'health': qurationController.quration.value.healthList,
          'diet': qurationController.quration.value.diet,
          'sprotein': qurationController.quration.value.sprotein,
        }).then((petfood) {
          filtering = Filtering();
          if (qurationController.quration.value.pet == '강아지') {
            petfood = filtering.filteringSize(petfood); // size 가 age 보다 먼저해야함
          }
          petfood = filtering.filteringDiet(petfood);
          petfood = filtering.filteringAge(petfood);
          petfood = filtering.filteringAlg(petfood);

          petfood = filtering.filteringHealth(petfood);

          Get.toNamed('/showpetfood', arguments: petfood);
        });
      },
    );
  }

  Widget InputPet() {
    return Row(
      children: [
        Text(
          '반려동물',
          style: surveyBig,
        ),
        SizedBox(width: 50),
        SelectButton(0, 'pet', 100, 50),
        SizedBox(width: 30),
        SelectButton(1, 'pet', 100, 50),
      ],
    );
  }

  Widget InputBreed() {
    return Obx(
      () => Row(
        children: [
          Text(
            '${petBreed[qurationController.selectedPetId.value]}',
            style: surveyBig,
          ),
          SizedBox(width: 40),
          Container(
            width: 200,
            height: 50,
            child: DropdownSearch<String>(
              showSearchBox: true,
              showSelectedItems: true,
              mode: Mode.MENU,
              onChanged: (value) => qurationController.setSelectedBreed(value),
              items: qurationController.selectedPetId.value == 0
                  ? dogBreedList
                  : catBreedList,
            ),
          ),
        ],
      ),
    );
  }

  Widget InputBirth() {
    return Row(
      children: [
        Text(
          '생년월일',
          style: surveyBig,
        ),
        SizedBox(width: 50),
        Container(
          width: 70,
          height: 50,
          child: DropdownButton(
            value: qurationController.selectedBirthYear.value,
            onChanged: (value) =>
                qurationController.setSelectedBirthYear(value),
            items: year.map((value) {
              return DropdownMenuItem(
                value: value.toString(),
                child: Text(value.toString(), style: surveyBig),
              );
            }).toList(),
          ),
        ),
        Text(
          '년',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(width: 30),
        Container(
          width: 50,
          height: 50,
          child: DropdownButton(
            value: qurationController.selectedBirthMonth.value,
            onChanged: (value) =>
                qurationController.setSelectedBirthMonth(value),
            items: month.map((value) {
              return DropdownMenuItem(
                value: value.toString(),
                child: Text(
                  value.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Text(
          '월',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(width: 30),
        Container(
          width: 50,
          height: 50,
          child: DropdownButton(
            value: qurationController.selectedBirthDay.value,
            onChanged: (value) => qurationController.setSelectedBirthDay(value),
            items: day.map((value) {
              return DropdownMenuItem(
                value: value.toString(),
                child: Text(
                  value.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Text(
          '일',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Widget InputSex() {
    return Row(
      children: [
        Text(
          '성별        ',
          style: surveyBig,
        ),
        SizedBox(width: 50),
        SelectButton(0, 'sex', 100, 50),
        SizedBox(width: 30),
        SelectButton(1, 'sex', 100, 50),
      ],
    );
  }

  Widget InputNeu() {
    return Row(
      children: [
        Text(
          '중성화 여부',
          style: surveyBig,
        ),
        SizedBox(width: 50),
        SelectButton(0, 'neu', 100, 50),
        SizedBox(width: 30),
        SelectButton(1, 'neu', 100, 50),
      ],
    );
  }

  Widget InputWeight() {
    return Row(
      children: [
        Text(
          '몸무게    ',
          style: surveyBig,
        ),
        SizedBox(width: 50),
        Container(
          width: 230,
          height: 50,
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            onSaved: (value) {
              qurationController.setWeight(value);
            },
          ),
        ),
        SizedBox(width: 30),
        Text('KG', style: surveyBig),
      ],
    );
  }

  Widget InputBcs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '체형',
          style: surveyBig,
        ),
        SizedBox(height: 20),
        Row(
          children: [
            BcsButton(0),
            SizedBox(width: 50),
            BcsButton(1),
            SizedBox(width: 50),
            BcsButton(2),
          ],
        ),
      ],
    );
  }

  Widget InputAlg() {
    var algList = qurationController.selectedPetId == 0 ? dogAlg : catAlg;
    return Column(
      children: [
        Row(
          children: [
            Text('알러지 여부', style: surveyBig),
            SizedBox(width: 50),
            SelectButton(0, 'alg', 100, 50),
            SizedBox(width: 30),
            SelectButton(1, 'alg', 100, 50),
          ],
        ),
        Obx(
          () => Visibility(
            visible: qurationController.isAlgButton == 0,
            child: Wrap(
              children: [
                for (int i = 0; i < algList.length; i++)
                  MultiSelectButton(i, 'alg', 100, 50),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget InputHealth() {
    var healthList =
        qurationController.selectedPetId == 0 ? dogHealth : catHealth;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('건강관리', style: surveyBig),
        Wrap(
          children: [
            for (int i = 0; i < healthList.length; i++)
              MultiSelectButton(i, 'health', 100, 50),
          ],
        ),
      ],
    );
  }

  Widget MultiSelectButton(
      int index, String name, double width, double height) {
    RxList controller = [].obs;
    var buttonList = [];
    if (name == 'alg') {
      controller = qurationController.algList;
      buttonList = qurationController.selectedPetId == 0 ? dogAlg : catAlg;
    } else if (name == 'health') {
      controller = qurationController.healthList;
      buttonList =
          qurationController.selectedPetId == 0 ? dogHealth : catHealth;
    }
    return InkWell(
      child: Obx(
        () => Container(
          margin: EdgeInsets.all(10),
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(
              color: controller.contains(buttonList[index])
                  ? louisColor
                  : Colors.grey,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text('${buttonList[index]}'),
          ),
        ),
      ),
      onTap: () {
        controller.contains(buttonList[index])
            ? controller.remove(buttonList[index])
            : controller.add(buttonList[index]);
      },
    );
  }

  Widget SelectButton(int index, String name, double width, double height) {
    RxInt controller = 0.obs;
    List buttonList = [];
    if (name == 'pet') {
      controller = qurationController.selectedPetId;
      buttonList = pet;
    } else if (name == 'sex') {
      controller = qurationController.selectedSexId;
      buttonList = sex;
    } else if (name == 'neu') {
      controller = qurationController.selectedNeuId;
      buttonList = yn;
    } else if (name == 'alg') {
      controller = qurationController.isAlgButton;
      buttonList = yn;
    }
    return InkWell(
      child: Obx(
        () => Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(
              color: controller.value == index ? louisColor : Colors.grey,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text('${buttonList[index]}'),
          ),
        ),
      ),
      onTap: () {
        controller.value = index;
      },
    );
  }

  Widget BcsButton(int index) {
    return Obx(
      () => InkWell(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  qurationController.selectedBcsId.value == index
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: qurationController.selectedBcsId.value == index
                      ? louisColor
                      : Colors.grey,
                ),
                SizedBox(height: 10),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: qurationController.selectedBcsId.value == index
                          ? louisColor
                          : Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    qurationController.selectedPetId.value == 0
                        ? dogBcsImg[index]
                        : catBcsImg[index],
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            qurationController.setSelectedBcsId(index);
          }),
    );
  }
}
