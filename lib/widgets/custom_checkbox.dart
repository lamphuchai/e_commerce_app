import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({Key? key, required this.value, required this.onChanged})
      : super(key: key);
  final bool value;
  final Function(bool? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        checkColor: Colors.white,
        activeColor: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
          4,
        )),
        side: const BorderSide(color: Colors.grey),
        value: value,
        onChanged: onChanged);
  }
}
