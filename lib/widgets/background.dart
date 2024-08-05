import 'package:flutter/material.dart';

class DismissibleBackgroundContainer extends StatelessWidget {
  const DismissibleBackgroundContainer({
    super.key,  this.right = true,
  });
  final bool right;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:right? Alignment.centerRight: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: ShapeDecoration(
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}