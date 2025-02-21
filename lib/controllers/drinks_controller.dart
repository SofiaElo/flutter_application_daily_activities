import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../models/drinks.dart';

class DrinksController {
  final storage = Hive.box("storage");

  RxList drinks;

  DrinksController() : drinks= [].obs {
  if (storage.get('drinks') == null) {
    storage.put('drinks', []);
  }

  drinks.value = storage
      .get('drinks')
      .map(
        (drink) => Drink.fromJson(drink),
      )
      .toList();
}

void _save() {
  storage.put(
    'drinks',
    drinks.map((drink) => drink.toJson()).toList(),
  );
}

void add(Drink drink) {
  drinks.add(drink);
  _save();
}


void increaseAmount(Drink drink) {
    drinks[drinks.indexOf(drink)].amount = drinks[drinks.indexOf(drink)].amount + 1;
    drinks.refresh();
    _save();
}

void decreaseAmount(Drink drink) {
  if (drinks[drinks.indexOf(drink)].amount>= 1) {
    drinks[drinks.indexOf(drink)].amount = drinks[drinks.indexOf(drink)].amount - 1;
    drinks.refresh();
    _save();
  }
}

void delete(Drink drink) {
  drinks.remove(drink);
  drinks.refresh();
  _save();
}

get size => drinks.length;

wholeAmount() {
  double sum = 0.0;
  for (final drink in drinks) {
    sum = sum + drink.amount;
  }
  return sum / 10.0;
}

}