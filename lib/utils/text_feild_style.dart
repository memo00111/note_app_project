import 'package:flutter/material.dart';

OutlineInputBorder borderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 1.5,
        color: Colors.black,
      ),
    );
  }