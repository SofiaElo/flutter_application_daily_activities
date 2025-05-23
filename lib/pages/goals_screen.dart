import 'package:flutter/material.dart';


import '../widgets/nav.dart';
import '../widgets/goal_screen/form_goals.dart';
import '../widgets/goal_screen/list_goals.dart';


class GoalScreen extends StatelessWidget {

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: ListView(
      padding: EdgeInsets.all(24.0),
      children: [
        Navigation(),
        FormGoals(),
        SizedBox(height: 16.0),
        GoalsList(),
      ],
    ),
  );
}
}
