import 'package:flutter/material.dart';

class CustomNoNotesWidget extends StatelessWidget {
  const CustomNoNotesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(top: 50),
        child: Text(
          "No Notes",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
  }
}