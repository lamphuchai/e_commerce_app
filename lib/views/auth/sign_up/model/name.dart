enum NameStatus { init, input, susses }

class Name {
  const Name(
      {required this.value, this.errText, this.status = NameStatus.init});
  final String value;
  final String? errText;
  final NameStatus status;

  Name copyWith({
    String? value,
    String? errText,
    NameStatus? status,
  }) {
    return Name(
      value: value ?? this.value,
      errText: errText ?? this.errText,
      status: status ?? this.status,
    );
  }

  static Name validation(String value) {
    if (value.isEmpty) {
      return Name(
          value: value,
          status: NameStatus.susses,
          errText: "Name cannot be empty");
    }
    return Name(value: value, status: NameStatus.susses);
  }

  @override
  String toString() =>
      'Name(value: $value, errText: $errText, status: $status)';
}
