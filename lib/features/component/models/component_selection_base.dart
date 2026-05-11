import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/component/models/component_action.dart';
import 'package:flx_nocode_flutter/features/component/models/component_size_mode.dart';

abstract class ComponentSelectionBase extends Component {
  final String label;
  final List<String> options;
  final HttpData? httpData;
  final String? optionKey;
  final String? optionLabel;
  final List<ComponentAction> onChangeActions;
  final bool required;
  final List<String> dependsOn;
  final ComponentSizeMode? widthMode;
  final double? width;
  final int? flex;

  ComponentSelectionBase({
    required super.id,
    required super.type,
    super.visibilityCondition,
    super.events,
    required this.label,
    required this.options,
    this.httpData,
    this.optionKey,
    this.optionLabel,
    this.onChangeActions = const [],
    this.required = false,
    this.dependsOn = const [],
    this.widthMode,
    this.width,
    this.flex,
  });

  @override
  Map<String, dynamic> toMap() => {
        ...super.toMap(),
        'label': label,
        'options': options,
        'httpData': httpData?.toJson(),
        'optionKey': optionKey,
        'optionLabel': optionLabel,
        'onChangeActions': onChangeActions.map((e) => e.toMap()).toList(),
        'required': required,
        'dependsOn': dependsOn,
        'widthMode': widthMode?.name,
        'width': width,
        'flex': flex,
      };
}
