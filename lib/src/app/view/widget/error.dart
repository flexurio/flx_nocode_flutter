import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NoCodeError extends StatelessWidget {
  const NoCodeError(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.red, width: 6),
      ),
      child: Row(
        children: [
          Icon(Icons.error, color: Colors.red),
          Gap(6),
          Text(message, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
