import 'dart:convert';

class Delivery {
  final String name;
  final String intendDate;
  final int price;
  Delivery({
    required this.name,
    required this.intendDate,
    required this.price,
  });

  Delivery copyWith({
    String? name,
    String? intendDate,
    int? price,
  }) {
    return Delivery(
      name: name ?? this.name,
      intendDate: intendDate ?? this.intendDate,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'intendDate': intendDate,
      'price': price,
    };
  }

  factory Delivery.fromMap(Map<String, dynamic> map) {
    return Delivery(
      name: map['name'] ?? '',
      intendDate: map['intendDate'] ?? '',
      price: map['price'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Delivery.fromJson(String source) =>
      Delivery.fromMap(json.decode(source));

  @override
  String toString() =>
      'Delivery(name: $name, intendDate: $intendDate, price: $price)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Delivery &&
        other.name == name &&
        other.intendDate == intendDate &&
        other.price == price;
  }

  @override
  int get hashCode => name.hashCode ^ intendDate.hashCode ^ price.hashCode;
}
