import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? textPrimary;
  final String? textSecondary;
  final Color backgroundColor;
  final void Function() onPressed;
  final double width;
  final double height;
  final TextStyle? primaryTextStyle;
  final TextStyle? secondaryTextStyle;

  const CustomButton({
    super.key,
    this.textPrimary,
    this.textSecondary,
    required this.backgroundColor,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 40.0,
    this.primaryTextStyle,
    this.secondaryTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(backgroundColor),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
        ),
        onPressed: onPressed,
        child: Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: textPrimary,
                  style: primaryTextStyle ??
                      const TextStyle(fontSize: 16, color: Colors.white),
                ),
                if (textSecondary != null)
                  TextSpan(
                    text: textSecondary,
                    style: secondaryTextStyle ??
                        const TextStyle(fontSize: 15, color: Colors.white),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
