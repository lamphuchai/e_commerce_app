import 'package:flutter/material.dart';

class ButtonLarge extends StatelessWidget {
  const ButtonLarge({Key? key, required this.label, required this.onPressed})
      : super(key: key);
  final String label;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            primary: const Color(0xffDB3022),
            minimumSize: const Size(double.infinity, 52)),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ));
  }
}
