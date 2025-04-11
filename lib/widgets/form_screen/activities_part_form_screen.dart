import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'form_activities.dart';
import 'activities_list.dart';

import '../../pages/results_screen.dart';



class ActivitiesFormScreen extends StatelessWidget {

  @override
Widget build(BuildContext context) {
  return Column(
      //padding: EdgeInsets.all(24.0),
      children: [
        Center(
            child: FormActivities(),
        ),
        SizedBox(height: 24.0),
        Center(child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
          Text(
          "Activities",
          style: TextStyle(fontSize: 20.0, color: Color.fromRGBO(186,1,200,1)),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios_outlined),
            onPressed: () {
              Get.to(() => ResultsScreen());
            }),
        ],
        ),
        ),
        SizedBox(height: 16.0),
        ActivitiesList(),
      ],
    );
}
}
