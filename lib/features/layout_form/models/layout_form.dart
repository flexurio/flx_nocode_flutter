import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/component/models/component_size_mode.dart';
import 'package:hive/hive.dart';
import 'submit_workflow.dart';

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
  final String? title;
  final Rule? visibleIf;
  final List<Component> components;
  final List<ButtonAction> buttons;
  final List<LayoutForm> multiForms;
  final SubmitWorkflow? submitWorkflow;
  final dynamic
      onInit; // Map<String, dynamic> (Workflow) or List<ActionD> (Legacy)
  final bool popup;
  final bool? submitButton;

  List<String> get componentIds => components.map((e) => e.id).toList();
  bool get useNewForm => components.isNotEmpty;
  bool get showSubmitButton {
    if (submitButton != null) return submitButton!;
    if (submitWorkflow != null && submitWorkflow!.showSubmitButton != null) {
      return submitWorkflow!.showSubmitButton == true;
    }
    return true;
  }

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
      } else if (c is ComponentContainer && c.child != null) {
        _collectComponents([c.child!], dest);
      } else if (c is ComponentConditional) {
        final branches = <Component>[c.then];
        if (c.otherwise != null) {
          branches.add(c.otherwise!);
        }
        _collectComponents(branches, dest);
      }
    }
  }

  LayoutForm.empty()
      : id = '',
        label = '',
        title = null,
        visibleIf = null,
        components = const [],
        buttons = const [],
        multiForms = const [],
        submitWorkflow = null,
        onInit = null,
        popup = false,
        submitButton = null;

  LayoutForm({
    required this.id,
    required this.label,
    this.title,
    this.visibleIf,
    required this.components,
    List<ButtonAction>? buttons,
    List<LayoutForm>? multiForms,
    SubmitWorkflow? submitWorkflow,
    dynamic onInit,
    this.popup = false,
    this.submitButton,
  })  : assert(label.trim().isNotEmpty, 'label is required'),
        buttons = List<ButtonAction>.unmodifiable(buttons ?? const []),
        submitWorkflow = submitWorkflow,
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
    final id = map['id']?.toString().trim() ??
        map['name']?.toString().trim() ??
        map['type']?.toString().trim() ??
        '';

    final label = map['label']?.toString().trim() ??
        map['name']?.toString().trim() ??
        map['title']?.toString().trim() ??
        map['type']?.toString().trim() ??
        (id.isNotEmpty ? id : 'Form');

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
    List<Component>? components;
    if (rawComponents != null && rawComponents.isNotEmpty) {
      components = rawComponents.map((e) {
        if (e is! Map) {
          throw const FormatException('Each component must be an object');
        }
        return Component.fromMap(Map<String, dynamic>.from(e));
      }).toList(growable: false);
    } else if (map.containsKey('groups') && map['groups'] is List) {
      components = _convertGroupsToComponents(map['groups'] as List);
    }

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

    SubmitWorkflow? submitWorkflow;
    if (map.containsKey('submit_workflow') && map['submit_workflow'] != null) {
      final raw = map['submit_workflow'];
      if (raw is! Map) {
        throw const FormatException('"submit_workflow" must be an object');
      }
      submitWorkflow = SubmitWorkflow.fromMap(Map<String, dynamic>.from(raw));
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

    final popup = map['popup'] == true ||
        map['is_popup'] == true ||
        map['type'] == 'popup';

    final bool? submitButton = map.containsKey('submit_button')
        ? (map['submit_button'] == true)
        : (map.containsKey('show_submit_button')
            ? (map['show_submit_button'] == true)
            : null);

    return LayoutForm(
      id: id,
      components: components ?? const [],
      label: label,
      title: map['title']?.toString().trim(),
      visibleIf: map['visible_if'] == null
          ? null
          : Rule.fromMap(_coerceJsonMap(map['visible_if'])),
      buttons: parsedActions,
      multiForms: multiForms,
      submitWorkflow: submitWorkflow,
      onInit: onInit,
      popup: popup,
      submitButton: submitButton,
    );
  }

  JsonMap toMap() {
    final m = <String, dynamic>{
      'id': id,
      'label': label,
      if (title != null && title!.isNotEmpty) 'title': title,
      if (popup) 'popup': true,
      if (submitButton != null) 'submit_button': submitButton,
      'components': components.map((e) => e.toMap()).toList(growable: false),
    };

    if (visibleIf != null) {
      m['visible_if'] = visibleIf!.toMap();
    }
    if (submitWorkflow != null) {
      m['submit_workflow'] = submitWorkflow!.toMap();
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
    String? title,
    Rule? visibleIf,
    List<ButtonAction>? buttons,
    List<Component>? components,
    List<LayoutForm>? multiForms,
    SubmitWorkflow? submitWorkflow,
    dynamic onInit,
    bool? popup,
    bool? submitButton,
  }) {
    return LayoutForm(
      id: id ?? this.id,
      components: components ?? this.components,
      label: label ?? this.label,
      title: title ?? this.title,
      visibleIf: visibleIf ?? this.visibleIf,
      buttons: buttons ?? this.buttons,
      multiForms: multiForms ?? this.multiForms,
      submitWorkflow: submitWorkflow ?? this.submitWorkflow,
      onInit: onInit ?? this.onInit,
      popup: popup ?? this.popup,
      submitButton: submitButton ?? this.submitButton,
    );
  }

  static List<Component> _convertGroupsToComponents(List groups) {
    final result = <Component>[];
    for (final group in groups) {
      if (group is! Map) continue;
      final rows = group['rows'] is List ? group['rows'] as List : [group];
      for (final row in rows) {
        if (row is! Map) continue;
        final fields = row['fields'];
        if (fields is! List) continue;
        final rowComponents = <Component>[];
        for (final fieldRef in fields) {
          final refStr = fieldRef.toString();
          rowComponents.add(
            ComponentTextField(
              id: refStr,
              label: refStr,
              flex: 1,
              widthMode: fields.length > 1 ? ComponentSizeMode.fill : null,
            ),
          );
        }
        if (rowComponents.length == 1) {
          result.add(rowComponents.first);
        } else if (rowComponents.length > 1) {
          result.add(
            ComponentRow(
              id: 'row_${rowComponents.first.id}',
              children: rowComponents,
              horizontalGap: 16,
            ),
          );
        }
      }
    }
    return result;
  }
}
