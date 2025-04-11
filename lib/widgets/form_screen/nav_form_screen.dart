import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/home_screen.dart';
import '../../pages/results_screen.dart';



class NavFormScreen extends StatelessWidget {

  @override
Widget build(BuildContext context) {
  return Column(
      //padding: EdgeInsets.all(24.0),
      children: [
        SizedBox(height: 16.0),
        Row(children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Get.to(() => HomeScreen());
            }),
          Expanded(child: Center(
            child: Text(
              "Your Day in Numbers",
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, 
              color: Color.fromRGBO(186,1,200,1)),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios_outlined),
            onPressed: () {
              Get.to(() => ResultsScreen());
            }),
        ],),
        SizedBox(height: 24.0),
      ],
    );
}
}
