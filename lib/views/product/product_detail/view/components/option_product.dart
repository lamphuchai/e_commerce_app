import 'package:e_commerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OptionProduct extends StatelessWidget {
  const OptionProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      width: double.infinity,
      child: Row(children: [
        Expanded(
            flex: 3, child: _buildItemButtonModal(label: "Size", onTap: () {})),
        const SizedBox(
          width: 16,
        ),
        Expanded(
            flex: 3,
            child: _buildItemButtonModal(label: "Black", onTap: () {})),
        const SizedBox(
          width: 6,
        ),
        Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerRight,
              child: LikeButton(onPressed: () {}),
            ))
      ]),
    );
  }

  Widget _buildItemButtonModal(
      {required VoidCallback onTap, required String label}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey, width: 0.5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.black, fontSize: 14),
            ),
            const Icon(
              Icons.expand_more,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
