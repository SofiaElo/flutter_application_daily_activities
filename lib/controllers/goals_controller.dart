import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../models/goal.dart';

class GoalsController {
  final storage = Hive.box("storage");

  RxList goals;

  GoalsController() : goals= [].obs {
  if (storage.get('goals') == null) {
    storage.put('goals', []);
  }

  goals.value = storage
      .get('goals')
      .map(
        (goal) => Goal.fromJson(goal),
      )
      .toList();
}

void _save() {
  storage.put(
    'goals',
    goals.map((goal) => goal.toJson()).toList(),
  );
}

void add(Goal drink) {
  goals.add(drink);
  _save();
}


void increaseAmount(Goal goal) {
    goals[goals.indexOf(goal)].amount = goals[goals.indexOf(goal)].amount + 1;
    goals.refresh();
    _save();
}

void decreaseAmount(Goal goal) {
  if (goals[goals.indexOf(goal)].amount>= 1) {
    goals[goals.indexOf(goal)].amount = goals[goals.indexOf(goal)].amount - 1;
    goals.refresh();
    _save();
  }
}

void delete(Goal drink) {
  goals.remove(drink);
  goals.refresh();
  _save();
}

get size => goals.length;

}