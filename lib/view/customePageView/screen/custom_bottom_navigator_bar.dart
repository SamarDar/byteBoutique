import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focalx_task6/core/constant_data/images.dart';

import '../../../widgets/customePageView/svg_image_positioned.dart';
import 'home_navigation_bar_design.dart';


class CustomBottomNavigatorBar extends StatefulWidget {
  const CustomBottomNavigatorBar({
    super.key,
    required this.width,
    required this.height,
    required this.pageController,
    this.onTap,
  });

  final double width;
  final double height;
  final PageController pageController;
  final void Function()? onTap;
  @override
  State<CustomBottomNavigatorBar> createState() =>
      _CustomBottomNavigatorBarState();
}

int currentIndex = 0;

class _CustomBottomNavigatorBarState extends State<CustomBottomNavigatorBar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double heightResponsive = height / 812;
    double widthResponsive = width / 375;
    return Stack(
      children: [
        Positioned(
          bottom: heightResponsive * -20,
          left: widthResponsive * 0,
          right: widthResponsive * 0,
          child: CustomPaint(
            size: Size(widget.width, widget.height),
            painter: HomeNavigationBarDesign(),
          ),
        ),
        SvgImagePositioned(
          onTap: () {
            setState(() {
              currentIndex = 0;
            });
            widget.pageController.animateToPage(
              currentIndex,
              duration: const Duration(milliseconds: 300), // Animation duration
              curve: Curves.easeInOut, // Animation curve
            );
          },
          mainColor: const Color(0xff707B81),
          color: currentIndex == 0
              ? const Color(0xff34C759)
              : const Color(0xff707B81),
          bottom: heightResponsive * 30,
          left: widthResponsive * 31,
          svgIcon: AppImages.home,
        ),
        SvgImagePositioned(
          onTap: () {
            setState(() {
              currentIndex = 1;
            });
            widget.pageController.animateToPage(
              currentIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          mainColor: const Color(0xff707B81),
          color: currentIndex == 1
              ? const Color(0xff34C759)
              : const Color(0xff707B81),
          bottom: heightResponsive * 30,
          left: widthResponsive * 94,
          svgIcon: AppImages.heart,
        ),
        SvgImagePositioned(
          onTap: () {
            setState(() {
              currentIndex = 2;
            });
            widget.pageController.animateToPage(
              currentIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          mainColor: const Color(0xff707B81),
          color: currentIndex == 2
              ? const Color(0xff34C759)
              : const Color(0xff707B81),
          bottom: heightResponsive * 30,
          right: widthResponsive * 99,
          svgIcon: AppImages.notification,
        ),
        SvgImagePositioned(
          onTap: () {
            setState(() {
              currentIndex = 3;
            });
            widget.pageController.animateToPage(
              currentIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          mainColor: const Color(0xff707B81),
          color: currentIndex == 3
              ? const Color(0xff34C759)
              : const Color(0xff707B81),
          bottom: heightResponsive * 30,
          right: widthResponsive * 31,
          svgIcon: AppImages.profile,
        ),
        Positioned(
            left: widthResponsive * 160,
            right: widthResponsive * 160,
            bottom: heightResponsive * 44,
            child: GestureDetector(
              onTap: widget.onTap,
              child: Container(
                padding: const EdgeInsets.all(15),
                width: widthResponsive * 56,
                height: heightResponsive * 56,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 24,
                          color: Color(0xff9EE199),
                          offset: Offset(0, 8))
                    ],
                    borderRadius: BorderRadius.circular(100),
                    color: const Color(0xff34C759)),
                child: SvgPicture.asset(
                  AppImages.cart,
                ),
              ),
            ))
      ],
    );
  }
}
