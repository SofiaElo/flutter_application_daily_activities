import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../models/activity.dart';

class ActivitiesController {
  final storage = Hive.box("storage");

  RxList activities;

  ActivitiesController() : activities = [].obs {
  if (storage.get('activities') == null) {
    storage.put('activities', []);
  }

  activities.value = storage
      .get('activities')
      .map(
        (activity) => Activity.fromJson(activity),
      )
      .toList();
}

void _save() {
  storage.put(
    'activities',
    activities.map((activity) => activity.toJson()).toList(),
  );
}

void add(Activity activity) {
  activities.add(activity);
  _save();
}


void increaseDuration(Activity activity) {
  if (activities[activities.indexOf(activity)].time + 0.5 <= 24) {
    activities[activities.indexOf(activity)].time = activities[activities.indexOf(activity)].time + 0.5;
    activities.refresh();
    _save();
  }
}

void decreaseDuration(Activity activity) {
  if (activities[activities.indexOf(activity)].time >= 0.5) {
    activities[activities.indexOf(activity)].time = activities[activities.indexOf(activity)].time - 0.5;
    activities.refresh();
    _save();
  }
}

void delete(Activity activity) {
  activities.remove(activity);
  activities.refresh();
  _save();
}

get size => activities.length;

}