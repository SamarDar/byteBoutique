import 'package:flutter/material.dart';

class CustomeRowCheckBox extends StatelessWidget {
  final String text1;
  final String text2;
  final Color color1;
  final Color color2;

  const CustomeRowCheckBox(
      {super.key,
      required this.text1,
      required this.text2,
      required this.color1,
      required this.color2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 18.0, color: color1),
        ),
        Text(
          text2,
          style: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.w500, color: color2),
        ),
      ],
    );
  }
}
