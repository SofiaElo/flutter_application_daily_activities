import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controllers/goals_controller.dart';
import '../../controllers/drinks_controller.dart';
import '../../controllers/activities_controller.dart';

class GoalsList extends StatelessWidget {
  final goalsController = Get.find<GoalsController>();
  final drinksController = Get.find<DrinksController>();
  final activitiesController = Get.find<ActivitiesController>();

  @override
Widget build(BuildContext context) {
  return Obx(
    () => Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: goalsController.goals
              .map(
                (goal) => Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.50, // 85% of screen width
                      child: ListTile(
                        minVerticalPadding: 2,
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(drinksController.drinks.any((elem) => elem.name == goal.name && elem.amount >= goal.amount) || activitiesController.activities.any((elem) => elem.name == goal.name && elem.time >= goal.amount)
                              ? Icons.done_all_rounded
                              : Icons.remove_done_rounded),
                          ],
                        ),
                        title: Center( child: Text(
                          goal.name,
                          style: TextStyle(fontSize: 18.0),
                        ),),
                        subtitle: Center(child: Text(
                          "goal: ${goal.amount}",
                          style: TextStyle(fontSize: 18.0),
                        ),),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        tileColor: drinksController.drinks.any((elem) => elem.name == goal.name && elem.amount >= goal.amount) || activitiesController.activities.any((elem) => elem.name == goal.name && elem.time >= goal.amount)
                        ? Colors.green[100]
                        : Colors.purple[100],
                      ),
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              )
              .toList(),
          ),
    ),
  );
}
}