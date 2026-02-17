import 'package:flutter/material.dart';

class FabStyle {
  final Color backgroundColor;
  final Color iconColor;
  final bool showLabels;   // ⭐ NEW PROPERTY

  const FabStyle({
    this.backgroundColor = Colors.teal,
    this.iconColor = Colors.white,
    this.showLabels = true,
  });
}
