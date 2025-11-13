import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component_table.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';

extension ComponentTableWidgets on ComponentTable {
  Widget toWidget() {
    return YuhuTable<JsonMap>(
      data: [
        {'label': 'Name', 'value': 'Suhal'},
      ],
      columns: [
        TableColumn(
          title: 'Label',
          builder: (Map<String, dynamic> p1, int p2) {
            return Text(p1['label'] as String);
          },
        ),
      ],
    );
  }
}
