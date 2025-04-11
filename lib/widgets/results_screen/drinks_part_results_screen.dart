import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/drinks_controller.dart';
import 'drinks_chart.dart';


class DrinksResultScreen extends StatelessWidget {
final drinksController = Get.find<DrinksController>();
  @override
Widget build(BuildContext context) {
  return  Obx(
          () => drinksController.size == 0
            ? Center(child: Text('No Drinks'))
            : Column(children: [
              Container(child: Column(children: [
                Center(child: Text(
                  "Your drinks for this day:",
                  style: TextStyle(fontSize: 16.0, 
                  color: Color.fromRGBO(186,1,200,1)),
                ),
                ),
                DrinksChart(),
              ],
              ),),
          ],),
        );
}
}
