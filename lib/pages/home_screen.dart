import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'form_screen.dart';
import 'goals_screen.dart';
import '../widgets/nav.dart';

class HomeScreen extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
  body: ListView(
      padding: EdgeInsets.all(24.0),
      children: [
        Navigation(),
        SizedBox(height: 24.0),
        Center(
            child:
              Text(
                "This is an application where one can track daily activities and the times they have taken. User can insert the amount of sleep, studying, sports and others as time spent with the accuracy of an 0.5 hour. Tracking drinks can be done in dl.",
                style: TextStyle(color: Color.fromRGBO(186,1,200,1)),
              ),
        ),
        SizedBox(height: 24.0),
        Center(
          child: ElevatedButton(
            onPressed: () => Get.to(() => FormScreen()),
            child: Text('Add To Tracker'),
          ),
          ),
        SizedBox(height: 24.0),
        Center(
          child: ElevatedButton(
            onPressed: () => Get.to(() => GoalScreen()),
            child: Text('Add To Goals'),
          ),
          ),
          SizedBox(height: 48),
        Center(
          child: Column(children: [
            Text("What is your current mood?",
            style: TextStyle(color: Color.fromRGBO(186,1,200,1), fontSize: 18),),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => Get.toNamed('/mood/sad'), style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent), child: Icon(Icons.mood_bad_rounded)),
                SizedBox(width: 24),
                ElevatedButton(onPressed: () => Get.toNamed('/mood/happy'), style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent), child: Icon(Icons.mood_rounded)),
            ],),
          ],
          ),
        ),
      ],
    ),
  );
}
}