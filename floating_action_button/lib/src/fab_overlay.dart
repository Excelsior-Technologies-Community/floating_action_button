import 'package:flutter/material.dart';

class FabOverlay extends StatelessWidget {
  final VoidCallback onTap;

  const FabOverlay({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.black54,
        ),
      ),
    );
  }
}
