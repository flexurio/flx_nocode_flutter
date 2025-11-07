import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';

extension ActionListExtenstion on List<ActionD> {
  List<Widget> toButtonList(
    BuildContext context,
    Map<String, dynamic> data,
    List<Map<String, dynamic>> parentData,
  ) {
    return map((e) => e.button(context, data, parentData)).toList();
  }
}

extension ActionExtenstion on ActionD {
  Widget button(
    BuildContext context,
    Map<String, dynamic> data,
    List<Map<String, dynamic>> parentData,
  ) {
    return LightButton(
      title: name,
      permission: null,
      onPressed: () async {},
      action: DataAction.print,
    );
  }
}
