import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  String name;

  ItemList({required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$name',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 40),
        Container(
          width: 1280,
          child: Row(
            children: [
              Container(
                height: 280,
                width: 210,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/오리젠.jpg',
                      width: 210,
                    ),
                    Text('   Product name'),
                    Text('   Price'),
                    Text('   Product name'),
                    Text('   Product name'),
                  ],
                ),
              ),
              Container(
                height: 280,
                width: 210,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/오리젠.jpg',
                      width: 210,
                    ),
                    Text('   Product name'),
                    Text('   Price'),
                    Text('   Product name'),
                    Text('   Product name'),
                  ],
                ),
              ),
              Container(
                height: 280,
                width: 210,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/오리젠.jpg',
                      width: 210,
                    ),
                    Text('   Product name'),
                    Text('   Price'),
                    Text('   Product name'),
                    Text('   Product name'),
                  ],
                ),
              ),
              Container(
                height: 280,
                width: 210,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/오리젠.jpg',
                      width: 210,
                    ),
                    Text('   Product name'),
                    Text('   Price'),
                    Text('   Product name'),
                    Text('   Product name'),
                  ],
                ),
              ),
              Container(
                height: 280,
                width: 210,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/오리젠.jpg',
                      width: 210,
                    ),
                    Text('   Product name'),
                    Text('   Price'),
                    Text('   Product name'),
                    Text('   Product name'),
                  ],
                ),
              ),
              Container(
                height: 280,
                width: 210,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/오리젠.jpg',
                      width: 210,
                    ),
                    Text('   Product name'),
                    Text('   Price'),
                    Text('   Product name'),
                    Text('   Product name'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
