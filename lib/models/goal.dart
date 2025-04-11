class Goal {
final String name;
double amount;

Goal(this.name, this.amount);

Map toJson() => {
      'name': name,
      'amount': amount,
    };

factory Goal.fromJson(Map json) {
  return Goal(json['name'], json['amount']);
}
}