import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onTap,
    this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixWidget,
    this.iconSize,
    this.txtColor,
    this.fontSize,
    this.color,
    this.foregroundColor = Colors.white,
    this.radius,
    this.width,
    this.height,
    this.disabledBackgroundColor,
    this.disabledForegroundColor,
    this.applyColorBlend = false,
  });

  final String?
      text; // TODO pass a Text widget instead of String, gives more configuration options
  final IconData? prefixIcon;
  final IconData? suffixIcon; // shouldn't be used when suffixWidget is non-null
  final Widget? suffixWidget; // shouldn't be used when suffixIcon is non-null
  final double? iconSize;
  final double? height;
  final double? width;
  final double? radius;
  final Color? txtColor;
  final double? fontSize;
  final VoidCallback? onTap;
  final Color? color;
  final Color? foregroundColor;
  final Color? disabledBackgroundColor;
  final Color? disabledForegroundColor;
  final bool applyColorBlend;

  @override
  Widget build(BuildContext context) {
    var txtView = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),

          //
          prefixIcon == null
              ? const SizedBox.shrink()
              : Icon(
                  prefixIcon,
                  size: iconSize ?? 36,
                ),

          // if (prefixIcon != null && text != null) const SizedBox(width: 32),
          if (prefixIcon != null && text != null) const Spacer(),

          text == null
              ? const SizedBox.shrink()
              : Text(
                  text!,
                  style: TextStyle(
                    color: txtColor ?? AppColors.white,
                    // fontSize: fontSize ?? Get.textTheme.titleMedium!.fontSize,
                  ),
                ),

          // if (suffixWidget != null && text != null) const SizedBox(width: 32),
          if (suffixWidget != null && text != null) const Spacer(),

          // suffixWidget == null ? const SizedBox.shrink() : suffixWidget!,
          suffixWidget == null ? const Spacer() : suffixWidget!,

          //
          // const Spacer(),
        ],
      ),
    );

    var tButtonView = TextButton(
      style: TextButton.styleFrom(
        foregroundColor: foregroundColor,
        side: (foregroundColor != null)
            ? BorderSide(color: foregroundColor!)
            : null,
      ),
      onPressed: onTap,
      child: txtView,
    );

    // Define your two colors
    Color colorForeground = Colors.black.withOpacity(.9);
    Color colorBackground = color ?? AppColors.primary;

    // Calculate the resulting color
    Color resultantColor = Color.alphaBlend(colorForeground, colorBackground);

    var eButtonView = ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        // backgroundColor: color,
        // backgroundColor: Get.theme.primaryColor,
        backgroundColor: applyColorBlend ? resultantColor : color,
        foregroundColor: foregroundColor,
        disabledBackgroundColor: disabledBackgroundColor,
        disabledForegroundColor: disabledForegroundColor,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 50),
        ),
        splashFactory: InkRipple.splashFactory,
      ),
      onPressed: onTap,
      child: txtView,
    );

    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 60,
      child: (color != null) ? eButtonView : tButtonView,
    );
  }
}
