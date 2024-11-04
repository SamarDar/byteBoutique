import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focalx_task6/widgets/customePageView/svg_color_mapper.dart';


class TopRoundedButton extends StatelessWidget {
  const TopRoundedButton({
    super.key,
    required this.assetsIcon,
    required this.color,
    required this.top,
    this.mainColor,
    this.circlecolor = Colors.white,
  });
  final String assetsIcon;
  final Color color;
  final Color? circlecolor;
  final double top;
  final Color? mainColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top),
      child: Container(
        width: 44,
        height: 44,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: circlecolor),
        child: SvgPicture(SvgAssetLoader(assetsIcon,
            colorMapper: SvgColorMapper(
                fromColor: mainColor ?? Colors.white, toColor: color))),
      ),
    );
  }
}
