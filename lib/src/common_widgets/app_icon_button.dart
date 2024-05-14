import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.bgColor,
    this.iconColor,
    this.iconSize,
    this.visualDensity,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final Color? bgColor;
  final Color? iconColor;
  final double? iconSize;
  final VisualDensity? visualDensity;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor ?? Colors.transparent,
      child: IconButton(
        icon: Icon(
          icon,
          color: iconColor ?? Theme.of(context).iconTheme.color,
          size: iconSize ?? 28,
        ),
        padding: const EdgeInsets.all(0),
        visualDensity:
            visualDensity, // to control whitespace around a Checkbox or PopupMenuButton or etc.
        onPressed: onTap,
        splashColor: Theme.of(context).iconTheme.color,
        splashRadius: 20,
      ),
    );
  }
}
