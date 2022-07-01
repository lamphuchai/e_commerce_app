enum PasswordStatus { init, input, susses }

class Password {
  const Password(
      {required this.value, this.errText, this.status = PasswordStatus.init});
  final String value;
  final String? errText;
  final PasswordStatus status;

  static Password validation(String value) {
    if (value.isEmpty) {
      return Password(
          value: value,
          status: PasswordStatus.input,
          errText: "Password cannot be empty");
    } else {
      return Password(value: value, status: PasswordStatus.susses);
    }
  }
}
