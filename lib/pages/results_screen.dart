import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/results_screen/nav_results_screen.dart';
import '../widgets/results_screen/activities_part_results_screen.dart';
import '../widgets/results_screen/drinks_part_results_screen.dart';

class Breakpoints {
  static const sm = 640;
}

class ResultsScreen extends StatelessWidget {

@override
Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return Scaffold(
    body: ListView(
      children: [
        SizedBox(height: 16.0),
        NavResultScreen(),
        SizedBox(height: 16.0),
        Expanded(child: 
          Center(child: size.width < Breakpoints.sm
            ? Column(children: [
              ActivitiesResultScreen(),
              DrinksResultScreen(),
            ],)
            : Row(children: [
              Flexible(child: ActivitiesResultScreen()),
              Flexible(child: DrinksResultScreen()),
            ],),
          ),
        ),
      ],
    )
  );
}
}
