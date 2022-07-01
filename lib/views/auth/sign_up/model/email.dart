import 'package:email_validator/email_validator.dart';

enum EmailStatus { init, input, susses }

class Email {
  const Email(
      {required this.value, this.errText, this.status = EmailStatus.init});
  final String value;
  final String? errText;
  final EmailStatus status;

  static Email validation(String value) {
    if (value.isEmpty) {
      return Email(
          value: value,
          status: EmailStatus.input,
          errText: "Email cannot be empty");
    }
    // if (EmailValidator.validate(value)) {
    //   return Email(
    //       value: value,
    //       status: EmailStatus.input,
    //       errText: "Invalid email format");
    // }
    return Email(value: value, status: EmailStatus.susses);
  }
}
