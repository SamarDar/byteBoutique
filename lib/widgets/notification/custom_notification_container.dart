
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomNotificationContainer extends StatelessWidget {
  final Color containerColor;
  final Color backgroundImageColor;
  final String time;
  final String imagePath;
  final String title;
  String? desc;
  String? onePrice;
  String? twoPrice;

  CustomNotificationContainer({
    super.key,
    required this.containerColor,
    required this.backgroundImageColor,
    required this.time,
    required this.imagePath,
    required this.title,
    this.desc,
    this.onePrice,
    this.twoPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 105,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: containerColor,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                right: 27.0, top: 10, left: 10, bottom: 10),
            child: Container(
              width: 87,
              height: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: backgroundImageColor,
              ),
              child: Image(
                image: AssetImage(imagePath),
              ),
            ),
          ),
          SizedBox(
            width: 152,
            child: Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 11),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: AutoSizeText(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      minFontSize: 8,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Flexible(
                    child: AutoSizeText(
                      desc ?? "",
                      style: const TextStyle(
                        color: Color(0xFF707B81),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 3,
                      minFontSize: 8,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            maxLines: 1,
                            minFontSize: 8,
                            overflow: TextOverflow.visible,
                            onePrice ?? "",
                            style: const TextStyle(
                              color: Color(0xFF2B2B2B),
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Flexible(
                          child: AutoSizeText(
                            maxLines: 1,
                            minFontSize: 8,
                            overflow: TextOverflow.ellipsis,
                            twoPrice ?? "",
                            style: const TextStyle(
                              color: Color(0xFF707B81),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: AutoSizeText(
                    time,
                    maxLines: 1,
                    minFontSize: 8,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF707B81),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
