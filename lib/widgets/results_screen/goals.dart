import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/goals_controller.dart';
import 'goals_list.dart';



class GoalsResultScreen extends StatelessWidget {
final goalsController = Get.find<GoalsController>();
  @override
Widget build(BuildContext context) {
  return  Obx(
          () => goalsController.size == 0
            ? Center(child: Text('No Goals'))
            : Column(children: [
              Container(child: Column(children: [
                Center(child: Text(
                  "Your goals for this day:",
                  style: TextStyle(fontSize: 16.0, 
                  color: Color.fromRGBO(186,1,200,1)),
                ),
                ),
                GoalsList(),
              ],
              ),),
          ],),
        );
}
}
