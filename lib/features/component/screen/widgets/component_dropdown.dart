import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/component/models/component_dropdown.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'component_dropdown_widget.dart';

extension ComponentDropdownWidgets on ComponentDropdown {
  Widget toWidget(JsonMap data) {
    return ComponentDropdownWidget(
      component: this,
      data: data,
    );
  }

  Widget toMockWidget() {
    final isFixed = widthMode == 'fixed';
    final isHug = widthMode == 'hug';
    final isFill = !isFixed && !isHug; // Default to fill

    return Column(
      crossAxisAlignment:
          isFill ? CrossAxisAlignment.stretch : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label.isNotEmpty) ...[
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),
        ],
        Container(
          height: 44,
          width: isFixed
              ? (width != null && width! < 120 ? 120.0 : width)
              : (isHug ? null : double.infinity),
          constraints: const BoxConstraints(minWidth: 120),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isHug)
                Text(
                  'Select $label...',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                )
              else
                Expanded(
                  child: Text(
                    'Select $label...',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                  ),
                ),
              Icon(Icons.arrow_drop_down, color: Colors.grey.shade600),
            ],
          ),
        ),
      ],
    );
  }
}
