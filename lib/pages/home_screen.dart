import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'form_screen.dart';

class HomeScreen extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
  body: ListView(
      padding: EdgeInsets.all(24.0),
      children: [
        Center(child: Text(
          "Your Day in Numbers",
          style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, 
          color: Color.fromRGBO(186,1,200,1)),
          ),
        ),
        SizedBox(height: 24.0),
        Center(
            child:
              Text(
                "This is an application where one can daily activities and the times they have taken. User can insert the amount of sleep, studying, sports and others as time spent with the accuracy of an hour. Tracking food and water can be tracked in cal and dl. Overall mood can also be tracked.",
                style: TextStyle(color: Color.fromRGBO(186,1,200,1), ),
              ),
        ),
        SizedBox(height: 24.0),
        Center(
          child: ElevatedButton(
            onPressed: () => Get.to(() => FormScreen()),
            child: Text('Add To Tracker'),
          ),
          ),
      ],
    ),
  );
}
}