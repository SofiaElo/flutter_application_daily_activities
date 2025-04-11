import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'form_drinks.dart';
import 'drinks_list.dart';

import '../../pages/results_screen.dart';



class DrinksFormScreen extends StatelessWidget {

  @override
Widget build(BuildContext context) {
  return Column(
      //padding: EdgeInsets.all(24.0),
      children: [
        Center(
            child: FormDrinks(),
        ),
        SizedBox(height: 24.0),
        Center(child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
          Text(
          "Drinks",
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
        SizedBox(height: 24.0),
        DrinksList(),
      ],
    );
}
}
