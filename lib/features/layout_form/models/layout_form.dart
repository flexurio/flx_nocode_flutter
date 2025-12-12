import 'package:flx_nocode_flutter/features/component/models/component.dart';
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
  final List<Component> components;
  final List<ButtonAction> buttons;
  final List<LayoutForm> multiForms;
  final Map<String, dynamic>? submitWorkflow;

  static const String createType = 'create';
  static const String updateType = 'update';
  static const String viewType = 'view';
  static const String homeType = 'home';

  LayoutForm.empty()
      : label = '',
        type = createType,
        groups = const [],
        visibleIf = null,
        components = const [],
        buttons = const [],
        multiForms = const [],
        submitWorkflow = null;

  LayoutForm({
    required this.label,
    required this.type,
    required List<GroupLayout> groups,
    this.visibleIf,
    required this.components,
    List<ButtonAction>? buttons,
    List<LayoutForm>? multiForms,
    Map<String, dynamic>? submitWorkflow,
  })  : assert(label.trim().isNotEmpty, 'label is required'),
        assert(type.trim().isNotEmpty, 'type is required'),
        groups = List<GroupLayout>.unmodifiable(groups),
        buttons = List<ButtonAction>.unmodifiable(buttons ?? const []),
        submitWorkflow =
            submitWorkflow == null ? null : Map<String, dynamic>.unmodifiable(submitWorkflow),
        multiForms = List<LayoutForm>.unmodifiable(
          (multiForms ?? const []).map(
            (f) => f.multiForms.isEmpty ? f : f.copyWith(multiForms: const []),
          ),
        );

  factory LayoutForm.fromMap(JsonMap map) =>
      _fromMapInternal(map, allowMultiForms: true);

  static LayoutForm _fromMapInternal(
    JsonMap map, {
    required bool allowMultiForms,
  }) {
    print('[LayoutForm] fromMap - parsing data');

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

    print('[LayoutForm] fromMap - parsing components');
    final rawComponents = map['components'] as List?;
    final components = rawComponents?.map((e) {
      if (e is! Map) {
        throw const FormatException('Each component must be an object');
      }
      return Component.fromMap(Map<String, dynamic>.from(e));
    }).toList(growable: false);
    print('[LayoutForm] fromMap - parsed components');

    final rawMultiForms = allowMultiForms ? map['multi_forms'] : null;
    List<LayoutForm> multiForms = const [];
    if (rawMultiForms != null) {
      if (rawMultiForms is! List) {
        throw const FormatException('"multi_forms" must be an array');
      }
      multiForms = rawMultiForms.map<LayoutForm>((e) {
        if (e is! Map) {
          throw const FormatException(
              'Each multi_forms item must be an object');
        }
        return LayoutForm._fromMapInternal(
          _coerceJsonMap(e),
          allowMultiForms: false, // only allow one nesting level
        );
      }).toList(growable: false);
    }

    Map<String, dynamic>? submitWorkflow;
    if (map.containsKey('submit_workflow') && map['submit_workflow'] != null) {
      final raw = map['submit_workflow'];
      if (raw is! Map) {
        throw const FormatException('"submit_workflow" must be an object');
      }
      submitWorkflow = Map<String, dynamic>.from(raw);
    }

    return LayoutForm(
      components: components ?? const [],
      label: map['label'].toString().trim(),
      type: map['type'].toString().trim(),
      groups: groups,
      visibleIf: map['visible_if'] == null
          ? null
          : Rule.fromMap(_coerceJsonMap(map['visible_if'])),
      buttons: parsedActions,
      multiForms: multiForms,
      submitWorkflow: submitWorkflow,
    );
  }

  JsonMap toMap() {
    final m = <String, dynamic>{
      'label': label,
      'type': type,
      'groups': groups.map((e) => e.toMap()).toList(growable: false),
      'components': components.map((e) => e.toMap()).toList(growable: false),
    };

    if (visibleIf != null) {
      m['visible_if'] = visibleIf!.toMap();
    }
    if (submitWorkflow != null) {
      m['submit_workflow'] = submitWorkflow;
    }
    if (buttons.isNotEmpty) {
      m['buttons'] = buttons.map((e) => e.toJson()).toList(growable: false);
    }
    if (multiForms.isNotEmpty) {
      m['multi_forms'] =
          multiForms.map((e) => e.toMap()).toList(growable: false);
    }

    return m;
  }

  LayoutForm copyWith({
    String? label,
    String? type,
    List<GroupLayout>? groups,
    Rule? visibleIf,
    List<ButtonAction>? buttons,
    List<Component>? components,
    List<LayoutForm>? multiForms,
    Map<String, dynamic>? submitWorkflow,
  }) {
    return LayoutForm(
      components: components ?? this.components,
      label: label ?? this.label,
      type: type ?? this.type,
      groups: groups ?? this.groups,
      visibleIf: visibleIf ?? this.visibleIf,
      buttons: buttons ?? this.buttons,
      multiForms: multiForms ?? this.multiForms,
      submitWorkflow: submitWorkflow ?? this.submitWorkflow,
    );
  }
}
