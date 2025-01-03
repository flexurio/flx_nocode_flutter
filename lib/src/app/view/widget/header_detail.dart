import 'package:flutter/material.dart';

class DataHeader extends StatelessWidget {
  const DataHeader({
    required this.label,
    required this.value,
    super.key,
    this.space,
  });

  final String label;
  final String value;
  final int? space;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          SizedBox(
            width: space?.toDouble() ?? 130,
            child: Text(label),
          ),
          Expanded(
            child: Text(
              ':   $value',
            ),
          ),
        ],
      ),
    );
  }
}
