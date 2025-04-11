import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/home_screen.dart';
import '../../pages/form_screen.dart';

class NavResultScreen extends StatelessWidget {

  @override
Widget build(BuildContext context) {
  return Row(children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Get.to(() => FormScreen());
            }),
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Get.to(() => HomeScreen());
            }),
          Expanded(child: Center(
            child: Text(
              "Your Day in Numbers",
              style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, 
              color: Color.fromRGBO(186,1,200,1)),
              ),
            ),
          ),
        ],
      );
}
}
