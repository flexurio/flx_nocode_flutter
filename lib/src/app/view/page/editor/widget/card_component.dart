import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
