import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controllers/activities_controller.dart';

class ActivitiesList extends StatelessWidget {
  final activitiesController = Get.find<ActivitiesController>();

  @override
Widget build(BuildContext context) {
  return Obx(
    () => activitiesController.size == 0
        ? Text('No Activities')
        : Column(
            children: activitiesController.activities
                .map(
                  (activity) => Column(children: [
                    ListTile(
                    minVerticalPadding: 2,
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        activitiesController.decreaseDuration(activity);
                      }),
                      IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        activitiesController.increaseDuration(activity);
                      }),
                    ],
                    ),
                    
                    title: Center(child: Text(
                      activity.name, 
                      style: TextStyle(fontSize: 18.0))),
                    subtitle: Center(child: Text("${activity.time}",
                    style: TextStyle(fontSize: 18.0),)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        activitiesController.delete(activity);
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