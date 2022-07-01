import 'dart:convert';

class Payment {
  final String name;
  final String number;
  final String expireDate;
  final String cvv;
  final String type;
  final bool defaultPayment;
  Payment({
    required this.name,
    required this.number,
    required this.expireDate,
    required this.cvv,
    required this.type,
    required this.defaultPayment,
  });

  Payment copyWith({
    String? name,
    String? number,
    String? expireDate,
    String? cvv,
    String? type,
    bool? defaultPayment,
  }) {
    return Payment(
      name: name ?? this.name,
      number: number ?? this.number,
      expireDate: expireDate ?? this.expireDate,
      cvv: cvv ?? this.cvv,
      type: type ?? this.type,
      defaultPayment: defaultPayment ?? this.defaultPayment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
      'expireDate': expireDate,
      'cvv': cvv,
      'type': type,
      'defaultPayment': defaultPayment,
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      name: map['name'] ?? '',
      number: map['number'] ?? '',
      expireDate: map['expireDate'] ?? '',
      cvv: map['cvv'] ?? '',
      type: map['type'] ?? '',
      defaultPayment: map['defaultPayment'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) =>
      Payment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Payment(name: $name, number: $number, expireDate: $expireDate, cvv: $cvv, type: $type, defaultPayment: $defaultPayment)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Payment &&
        other.name == name &&
        other.number == number &&
        other.expireDate == expireDate &&
        other.cvv == cvv &&
        other.type == type &&
        other.defaultPayment == defaultPayment;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        number.hashCode ^
        expireDate.hashCode ^
        cvv.hashCode ^
        type.hashCode ^
        defaultPayment.hashCode;
  }
}
