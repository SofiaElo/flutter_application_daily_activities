import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/nav.dart';


class Breakpoints {
  static const sm = 800;
}

class MoodScreen extends StatelessWidget {

@override
Widget build(BuildContext context) {
  final mood = Get.parameters['id'];

  return Scaffold(
    body: ListView(
      padding: EdgeInsets.all(24.0),
      children: [
        Navigation(),
        SizedBox(height: 48,),
        Center(child: 
        mood == "sad"
        ? Text("Why so sad :( Hopefully your day gets better!", 
        style: TextStyle(color: Color.fromRGBO(186, 1, 200, 1), fontSize: 18),)
        : Text("Yay you are HAPPY!!!", 
        style: TextStyle(color: Color.fromRGBO(186, 1, 200, 1), fontSize: 18),)),
      ],
    ),
  );
}
}
