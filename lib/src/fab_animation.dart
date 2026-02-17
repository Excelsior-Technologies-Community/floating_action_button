import 'package:flutter/material.dart';

class FabAnimation {
  static Animation<double> rotation(AnimationController controller) {
    return Tween<double>(begin: 0, end: 0.125).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
  }

  static Animation<double> fade(AnimationController controller) {
    return Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeIn),
    );
  }
}
