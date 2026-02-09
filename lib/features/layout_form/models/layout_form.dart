import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:hive/hive.dart';

import 'package:flx_nocode_flutter/features/entity/models/rule.dart';
import 'package:flx_nocode_flutter/features/entity/models/button_action.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';

typedef JsonMap = Map<String, dynamic>;

/// Utility to coerce dynamic into JsonMap with a clear error if not possible.
JsonMap _coerceJsonMap(dynamic v) {
  if (v is Map) return v.cast<String, dynamic>();
  throw const FormatException('Expected an object');
}

class LayoutForm extends HiveObject {
  final String id;
  final String label;
  final Rule? visibleIf;
  final List<Component> components;
  final List<ButtonAction> buttons;
  final List<LayoutForm> multiForms;
  final Map<String, dynamic>? submitWorkflow;
  final dynamic
      onInit; // Map<String, dynamic> (Workflow) or List<ActionD> (Legacy)

  List<String> get componentIds => components.map((e) => e.id).toList();
  bool get useNewForm => components.isNotEmpty;

  List<Component> get allComponents {
    final list = <Component>[];
    _collectComponents(components, list);
    for (final mf in multiForms) {
      _collectComponents(mf.components, list);
    }
    return list;
  }

  void _collectComponents(List<Component> src, List<Component> dest) {
    for (final c in src) {
      dest.add(c);
      // We manually check for known container types to avoid circular dependencies
      // if possible, but since we are in the same package it should be fine.
      if (c is ComponentColumn) {
        _collectComponents(c.children, dest);
      } else if (c is ComponentRow) {
        _collectComponents(c.children, dest);
      }
    }
  }

  LayoutForm.empty()
      : id = '',
        label = '',
        visibleIf = null,
        components = const [],
        buttons = const [],
        multiForms = const [],
        submitWorkflow = null,
        onInit = null;

  LayoutForm({
    required this.id,
    required this.label,
    this.visibleIf,
    required this.components,
    List<ButtonAction>? buttons,
    List<LayoutForm>? multiForms,
    Map<String, dynamic>? submitWorkflow,
    dynamic onInit,
  })  : assert(label.trim().isNotEmpty, 'label is required'),
        buttons = List<ButtonAction>.unmodifiable(buttons ?? const []),
        submitWorkflow = submitWorkflow == null
            ? null
            : Map<String, dynamic>.unmodifiable(submitWorkflow),
        multiForms = List<LayoutForm>.unmodifiable(
          (multiForms ?? const []).map(
            (f) => f.multiForms.isEmpty ? f : f.copyWith(multiForms: const []),
          ),
        ),
        onInit = onInit;

  factory LayoutForm.fromMap(JsonMap map) =>
      _fromMapInternal(map, allowMultiForms: true);

  static LayoutForm _fromMapInternal(
    JsonMap map, {
    required bool allowMultiForms,
  }) {
    final id = map['id']?.toString().trim() ?? '';

    if (map['label'] == null || map['label'].toString().trim().isEmpty) {
      throw const FormatException('Action "label" is required');
    }

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

    final rawComponents = map['components'] as List?;
    final components = rawComponents?.map((e) {
      if (e is! Map) {
        throw const FormatException('Each component must be an object');
      }
      return Component.fromMap(Map<String, dynamic>.from(e));
    }).toList(growable: false);

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

    final rawOnInit = map['on_init'] ?? map['onInit'];
    dynamic onInit;
    if (rawOnInit is List) {
      onInit = rawOnInit.map<ActionD>((e) {
        if (e is! Map) {
          throw const FormatException('Each on_init item must be an object');
        }
        return ActionD.fromJson(e.cast<String, dynamic>());
      }).toList();
    } else if (rawOnInit is Map) {
      onInit = Map<String, dynamic>.from(rawOnInit);
    }

    return LayoutForm(
      id: id,
      components: components ?? const [],
      label: map['label'].toString().trim(),
      visibleIf: map['visible_if'] == null
          ? null
          : Rule.fromMap(_coerceJsonMap(map['visible_if'])),
      buttons: parsedActions,
      multiForms: multiForms,
      submitWorkflow: submitWorkflow,
      onInit: onInit,
    );
  }

  JsonMap toMap() {
    final m = <String, dynamic>{
      'id': id,
      'label': label,
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

    if (onInit != null) {
      if (onInit is List<ActionD>) {
        m['on_init'] = onInit.map((e) => e.toJson()).toList();
      } else if (onInit is List) {
        m['on_init'] = onInit;
      } else if (onInit is Map) {
        m['on_init'] = onInit;
      }
    }

    return m;
  }

  LayoutForm copyWith({
    String? id,
    String? label,
    Rule? visibleIf,
    List<ButtonAction>? buttons,
    List<Component>? components,
    List<LayoutForm>? multiForms,
    Map<String, dynamic>? submitWorkflow,
    dynamic onInit,
  }) {
    return LayoutForm(
      id: id ?? this.id,
      components: components ?? this.components,
      label: label ?? this.label,
      visibleIf: visibleIf ?? this.visibleIf,
      buttons: buttons ?? this.buttons,
      multiForms: multiForms ?? this.multiForms,
      submitWorkflow: submitWorkflow ?? this.submitWorkflow,
      onInit: onInit ?? this.onInit,
    );
  }
}
