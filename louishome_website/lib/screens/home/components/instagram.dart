import 'package:flutter/material.dart';
import 'package:louishome_website/data/constants.dart';

class Instagram extends StatelessWidget {
  const Instagram({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: basicWidth,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera_alt,
                size: 30,
              ),
              Text(
                'INSTAGRAM',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'FOLLOW on #Louishome_official',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 50),
          Container(
            width: basicWidth,
            height: 550,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  Container(
                    width: 260,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.1, color: Colors.grey),
                    ),
                    child: Image.asset(
                      'images/petfood/$index.png',
                      height: 250,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 100,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(width: 0.1, color: Colors.grey),
            ),
            child: Center(child: Text('더보기')),
          )
        ],
      ),
    );
  }
}
