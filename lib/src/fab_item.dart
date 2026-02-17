import 'package:flutter/material.dart';

class FabItem {
  final IconData icon;
  final String? label;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Color? iconColor;

  const FabItem({
    required this.icon,
    required this.onTap,
    this.label,
    this.backgroundColor,
    this.iconColor,
  });
}
