import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focalx_task6/widgets/customePageView/svg_color_mapper.dart';


class SvgImagePositioned extends StatelessWidget {
  const SvgImagePositioned({
    super.key,
    required this.svgIcon,
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.color = Colors.white,
    this.mainColor,
    this.onTap,
  });
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final Color color;
  final Color? mainColor;
  final String svgIcon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        left: left,
        right: right,
        bottom: bottom,
        child: InkWell(
          onTap: onTap,
          child: SvgPicture(SvgAssetLoader(svgIcon,
              colorMapper: SvgColorMapper(
                  fromColor: mainColor ?? Colors.white, toColor: color))),
        ));
  }
}
