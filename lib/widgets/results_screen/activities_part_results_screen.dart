import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/activities_controller.dart';
import 'activities_chart.dart';


class ActivitiesResultScreen extends StatelessWidget {
final activitiesController = Get.find<ActivitiesController>();
  @override
Widget build(BuildContext context) {
  return  Obx(
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
        );
}
}
