class Activity {
final String name;
double time;

Activity(this.name, this.time);

Map toJson() => {
      'name': name,
      'time': time,
    };

factory Activity.fromJson(Map json) {
  return Activity(json['name'], json['time']);
}
}