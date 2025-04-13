import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/home_screen.dart';
import '../pages/results_screen.dart';
import '../pages/goals_screen.dart';
import '../pages/form_screen.dart';



class Navigation extends StatelessWidget {

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
          IconButton(
            icon: Icon(Icons.add_task_rounded),
            onPressed: () {
              Get.to(() => GoalScreen());
            }),
          IconButton(
            icon: Icon(Icons.add_chart_rounded),
            onPressed: () {
              Get.to(() => FormScreen());
            }),
          IconButton(
            icon: Icon(Icons.bar_chart_rounded),
            onPressed: () {
              Get.to(() => ResultsScreen());
            }),
          Expanded(child: Center(
            child: Text(
              "Your Day in Numbers",
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, 
              color: Color.fromRGBO(186,1,200,1)),
              ),
            ),
          ),
          
        ],),
        SizedBox(height: 24.0),
      ],
    );
}
}
