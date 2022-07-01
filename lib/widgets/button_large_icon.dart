import 'package:flutter/material.dart';

class ButtonLargeIcon extends StatelessWidget {
  const ButtonLargeIcon(
      {Key? key, required this.iconUrl, required this.onPressed})
      : super(key: key);
  final String iconUrl;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(92, 64),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
      child: Image.asset(iconUrl),
    );
  }
}
