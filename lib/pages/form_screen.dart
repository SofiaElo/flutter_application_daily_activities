import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../widgets/form_screen/drinks_part_form_screen.dart';
import '../widgets/form_screen/activities_part_form_screen.dart';
import '../widgets/form_screen/nav_form_screen.dart';


class Breakpoints {
  static const sm = 800;
}

class FormScreen extends StatelessWidget {

@override
Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;

  return Scaffold(
    body: ListView(
      padding: EdgeInsets.all(24.0),
      children: [
        NavFormScreen(),
           size.width < Breakpoints.sm
            ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrinksFormScreen(),
                SizedBox(height: 120.0),
                ActivitiesFormScreen(),
            ],)
            : IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(child: DrinksFormScreen()),
                      SizedBox(width: 20.0),
                      Flexible(child: ActivitiesFormScreen()),
                    ],
                  ),
                ),
        
      ],
    ),
  );
}
}
