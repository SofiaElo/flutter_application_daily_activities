class Drink {
final String name;
double amount;

Drink(this.name, this.amount);

Map toJson() => {
      'name': name,
      'amount': amount,
    };

factory Drink.fromJson(Map json) {
  return Drink(json['name'], json['amount']);
}
}