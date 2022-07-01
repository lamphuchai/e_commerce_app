import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({Key? key, this.onPressed}) : super(key: key);
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: 36,
      child: Ink(
        decoration: const ShapeDecoration(
          color: Colors.white,
          shadows: [
            BoxShadow(
                color: Colors.black26, offset: Offset(1, 2), blurRadius: 6)
          ],
          shape: CircleBorder(),
        ),
        child: IconButton(
            splashRadius: 20,
            onPressed: onPressed,
            icon: const Icon(
              Icons.favorite_border_outlined,
              size: 20,
              color: Colors.grey,
            )),
      ),
    );
  }
}
