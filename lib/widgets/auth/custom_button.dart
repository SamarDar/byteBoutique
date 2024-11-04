import 'package:flutter/material.dart';
import '../../core/constant_data/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final void Function() onPressed;
  final String buttonText;
  final TextStyle buttonTextStyle;
  final Color backgroundColor;
  final String? assetImage;

  const CustomButton({
    super.key,
    this.assetImage,
    required this.onPressed,
    required this.buttonText,
    required this.buttonTextStyle,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(
          vertical: 17.0,
        ),
        textStyle: AppTextStyles.buttonStyle,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          assetImage != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Image(
                    image: AssetImage(assetImage!),
                  ),
                )
              : const SizedBox(),
          Text(
            buttonText,
            style: buttonTextStyle,
          ),
        ],
      ),
    );
  }
}
