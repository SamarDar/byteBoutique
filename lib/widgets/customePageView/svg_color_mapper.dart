import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgColorMapper implements ColorMapper {
  final Color fromColor;
  final Color toColor;

  SvgColorMapper({required this.fromColor, required this.toColor});

  @override
  Color substitute(
      String? id,
      String elementName,
      String attributeName,
      Color color,
      ) {
    if (color == fromColor) {
      return toColor;
    }
    return color;
  }
}
