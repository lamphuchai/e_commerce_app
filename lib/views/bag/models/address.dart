import 'dart:convert';

class Address {
  final String id;
  final String fullName;
  final String address;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final bool defaultAddress;
  const Address({
    required this.id,
    required this.fullName,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.country,
    required this.defaultAddress,
  });

  String get fullAddress => '$address ,$city, $zipCode, $country';
  Address copyWith({
    String? id,
    String? fullName,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    String? country,
    bool? defaultAddress,
  }) {
    return Address(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
      defaultAddress: defaultAddress ?? this.defaultAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'address': address,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'country': country,
      'defaultAddress': defaultAddress,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'] ?? '',
      fullName: map['fullName'] ?? '',
      address: map['address'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      zipCode: map['zipCode'] ?? '',
      country: map['country'] ?? '',
      defaultAddress: map['defaultAddress'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Address(id: $id, fullName: $fullName, address: $address, city: $city, state: $state, zipCode: $zipCode, country: $country, defaultAddress: $defaultAddress)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Address &&
        other.id == id &&
        other.fullName == fullName &&
        other.address == address &&
        other.city == city &&
        other.state == state &&
        other.zipCode == zipCode &&
        other.country == country &&
        other.defaultAddress == defaultAddress;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        fullName.hashCode ^
        address.hashCode ^
        city.hashCode ^
        state.hashCode ^
        zipCode.hashCode ^
        country.hashCode ^
        defaultAddress.hashCode;
  }
}
