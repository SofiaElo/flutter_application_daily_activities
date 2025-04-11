import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controllers/goals_controller.dart';

class GoalsList extends StatelessWidget {
  final goalsController = Get.find<GoalsController>();

  @override
Widget build(BuildContext context) {
  return Obx(
    () => goalsController.size == 0
        ? Text('No Goals')
        : Column(
            children: goalsController.goals
                .map(
                  (goal) => Column(children: [
                    ListTile(
                    minVerticalPadding: 2,
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        goalsController.increaseAmount(goal);
                      }),
                      IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        goalsController.decreaseAmount(goal);
                      }),
                    ],
                    ),
                    
                    title: Center(child: Text(
                      goal.name, 
                      style: TextStyle(fontSize: 18.0))),
                    subtitle: Center(child: Text("${goal.amount}",
                    style: TextStyle(fontSize: 18.0),)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        goalsController.delete(goal);
                      },
                    ),
                    tileColor: Colors.purple[100],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  SizedBox(height: 8.0),
                  ]))
                .toList(),
          ),
  );
}
}