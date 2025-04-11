import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controllers/drinks_controller.dart';

class DrinksList extends StatelessWidget {
  final drinksController = Get.find<DrinksController>();

  @override
Widget build(BuildContext context) {
  return Obx(
    () => drinksController.size == 0
        ? Text('No Drinks')
        : Column(
            children: drinksController.drinks
                .map(
                  (drink) => Column(children: [
                    ListTile(
                    minVerticalPadding: 2,
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        drinksController.increaseAmount(drink);
                      }),
                      IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        drinksController.decreaseAmount(drink);
                      }),
                    ],
                    ),
                    
                    title: Center(child: Text(
                      drink.name, 
                      style: TextStyle(fontSize: 18.0))),
                    subtitle: Center(child: Text("${drink.amount}",
                    style: TextStyle(fontSize: 18.0),)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        drinksController.delete(drink);
                      },
                    ),
                    tileColor: Colors.purple[100],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  SizedBox(height: 8.0),
                  ]))
                .toList(),
          ),
  );
}
}