import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_conditional.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

void main() {
  group('LayoutForm allComponents Tests', () {
    test('collects components inside ComponentConditional then and otherwise branches', () {
      final tThen = ComponentText(id: 't_then', value: 'Then Branch');
      final tElse = ComponentText(id: 't_else', value: 'Else Branch');
      final conditional = ComponentConditional(
        id: 'cond',
        condition: 'true',
        then: tThen,
        otherwise: tElse,
      );

      final form = LayoutForm(
        id: 'test_form',
        label: 'Test Form',
        components: [conditional],
      );

      final all = form.allComponents;
      expect(all.map((c) => c.id).toList(), containsAll(['cond', 't_then', 't_else']));
    });
  });
}
