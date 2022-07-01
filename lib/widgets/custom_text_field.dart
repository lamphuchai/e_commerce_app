import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.errorText,
      this.suffixIcon,
      this.labelText,
      this.onChanged,
      this.color,
      this.textInputAction,
      this.keyboardType,
      this.textEditingController})
      : super(key: key);
  final String? errorText;
  final Widget? suffixIcon;
  final String? labelText;
  final Function(String)? onChanged;
  final Color? color;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextEditingController? textEditingController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              border: errorText != null ? Border.all(color: Colors.red) : null,
              color: color ?? Colors.black12,
              borderRadius: BorderRadius.circular(5)),
          child: TextField(
            controller: textEditingController,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                border: InputBorder.none,
                suffixIcon: suffixIcon,
                labelText: labelText,
                labelStyle: TextStyle(
                    color: errorText == null ? Colors.grey : Colors.red),
                fillColor: color ?? Colors.black12),
            onChanged: onChanged,
          ),
        ),
        if (errorText != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              errorText ?? "",
              style: const TextStyle(color: Colors.red),
            ),
          )
        ],
      ],
    );
  }
}
