import 'package:hive/hive.dart';

import 'package:flx_nocode_flutter/features/entity/models/group_layout.dart';
import 'package:flx_nocode_flutter/features/entity/models/rule.dart';
import 'package:flx_nocode_flutter/features/entity/models/button_action.dart';

typedef JsonMap = Map<String, dynamic>;

/// Utility to coerce dynamic into JsonMap with a clear error if not possible.
JsonMap _coerceJsonMap(dynamic v) {
  if (v is Map) return v.cast<String, dynamic>();
  throw const FormatException('Expected an object');
}

class LayoutForm extends HiveObject {
  final String label;
  final String type; // "create" | "update" | "view" | "home"
  final List<GroupLayout> groups;
  final Rule? visibleIf;
  final List<ButtonAction> buttons;

  LayoutForm({
    required this.label,
    required this.type,
    required List<GroupLayout> groups,
    this.visibleIf,
    List<ButtonAction>? buttons,
  })  : assert(label.trim().isNotEmpty, 'label is required'),
        assert(type.trim().isNotEmpty, 'type is required'),
        assert(groups.isNotEmpty, 'groups must not be empty'),
        groups = List<GroupLayout>.unmodifiable(groups),
        buttons = List<ButtonAction>.unmodifiable(buttons ?? const []);

  factory LayoutForm.fromMap(JsonMap map) {
    if (map['type'] == null || map['type'].toString().trim().isEmpty) {
      throw const FormatException('Action "type" is required');
    }
    if (map['label'] == null || map['label'].toString().trim().isEmpty) {
      throw const FormatException('Action "label" is required');
    }

    final rawGroups = map['groups'];
    if (rawGroups is! List) {
      throw const FormatException('"groups" must be an array');
    }
    if (rawGroups.isEmpty) {
      throw const FormatException('"groups" must not be empty');
    }

    final groups = rawGroups.map((e) {
      if (e is! Map) {
        throw const FormatException('Each group must be an object');
      }
      return GroupLayout.fromMap(e.cast<String, dynamic>());
    }).toList(growable: false);

    final dynamic rawActions =
        map.containsKey('buttons') ? map['buttons'] : null;

    List<ButtonAction> parsedActions = const [];
    if (rawActions != null) {
      if (rawActions is! List) {
        throw const FormatException('"actions"/"buttons" must be an array');
      }

      parsedActions = rawActions.map<ButtonAction>((e) {
        if (e is! Map) {
          throw const FormatException(
            'Each item in actions/buttons must be an object',
          );
        }

        final m = e.cast<String, dynamic>();

        final isActionLike = m.containsKey('kind') &&
            m.containsKey('method') &&
            m.containsKey('url');

        if (isActionLike) {
          // e.g. { kind, method, url, content_type, payload }
          return ButtonAction.fromJson(m);
        }

        // Jika item berbentuk LayoutButton { id, label, action: {...} }
        if (m['action'] is Map) {
          final am = _coerceJsonMap(m['action']);
          return ButtonAction.fromJson(am);
        }

        throw const FormatException(
          'actions/buttons item must be either an action object '
          'or a button object containing an "action" object.',
        );
      }).toList(growable: false);
    }

    return LayoutForm(
      label: map['label'].toString().trim(),
      type: map['type'].toString().trim(),
      groups: groups,
      visibleIf: map['visible_if'] == null
          ? null
          : Rule.fromMap(_coerceJsonMap(map['visible_if'])),
      buttons: parsedActions,
    );
  }

  JsonMap toMap() {
    final m = <String, dynamic>{
      'label': label,
      'type': type,
      'groups': groups.map((e) => e.toMap()).toList(growable: false),
    };

    if (visibleIf != null) {
      m['visible_if'] = visibleIf!.toMap();
    }
    if (buttons.isNotEmpty) {
      m['buttons'] = buttons.map((e) => e.toJson()).toList(growable: false);
    }

    return m;
  }

  LayoutForm copyWith({
    String? label,
    String? type,
    List<GroupLayout>? groups,
    Rule? visibleIf,
    List<ButtonAction>? buttons,
  }) {
    return LayoutForm(
      label: label ?? this.label,
      type: type ?? this.type,
      groups: groups ?? this.groups,
      visibleIf: visibleIf ?? this.visibleIf,
      buttons: buttons ?? this.buttons,
    );
  }
}
