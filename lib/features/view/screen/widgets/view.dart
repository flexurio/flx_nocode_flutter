import 'package:flutter/material.dart';
import 'package:flx_nocode_flutter/features/view/models/view.dart';

extension ListDViewWidget on List<DView> {
  List<Widget> buildButtons(BuildContext context, Map<String, dynamic> data,
      List<Map<String, dynamic>> parentData, bool bypassPermission) {
    return this
        .map(
          (e) => e.buttonLarge(
            context,
            data,
            parentData,
            bypassPermission,
          ),
        )
        .toList();
  }
}
