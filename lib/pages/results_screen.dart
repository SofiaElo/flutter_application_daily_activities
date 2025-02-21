import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/home_screen.dart';
import '../pages/form_screen.dart';

import '../controllers/activities_controller.dart';
import '../controllers/drinks_controller.dart';
import '../widgets/activities_chart.dart';
import '../widgets/drinks_chart.dart';

class ResultsScreen extends StatelessWidget {
  final activitiesController = Get.find<ActivitiesController>();
  final drinksController = Get.find<DrinksController>();

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: ListView(
      children: [
        SizedBox(height: 16.0),
        Row(children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Get.to(() => FormScreen());
            }),
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
        ],),
        SizedBox(height: 16.0),
        Obx(
          () => activitiesController.size == 0
            ? Center(child: Text('No Activities'))
            : Column(children: [
              Container(child: Column(children: [
                Center(child: Text(
                  "Your activities in hours for this day:",
                  style: TextStyle(fontSize: 16.0, 
                  color: Color.fromRGBO(186,1,200,1)),
                ),
                ),
                ActivitiesChart(),
              ],
              ),),
          ],),
        ),
        Obx(
          () => drinksController.size == 0
            ? Center(child: Text('No Drinks'))
            : Column(children: [
              Container(child: Column(children: [
                Center(child: Text(
                  "Your drinks for this day:",
                  style: TextStyle(fontSize: 16.0, 
                  color: Color.fromRGBO(186,1,200,1)),
                ),
                ),
                DrinksChart(),
              ],
              ),),
          ],),
        ),
      ],
    )
  );
}
}
