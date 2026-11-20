import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/component/models/component_action.dart';
import 'package:flx_nocode_flutter/features/component/models/component_input_base.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

abstract class ComponentSelectionBase extends ComponentInputBase {
  final List<dynamic> options;
  final HttpData? httpData;
  final String? optionKey;
  final String? optionLabel;
  final List<ComponentAction> onChangeActions;
  final List<String> dependsOn;
  final bool searchLive;
  final int? searchLiveLimit;
  final String? searchLiveParameter;

  ComponentSelectionBase({
    required super.id,
    required super.type,
    super.visibilityCondition,
    super.events,
    required super.label,
    required this.options,
    this.httpData,
    this.optionKey,
    this.optionLabel,
    this.onChangeActions = const [],
    super.required,
    super.enabled = true,
    this.dependsOn = const [],
    this.searchLive = false,
    this.searchLiveLimit,
    this.searchLiveParameter,
    super.widthMode,
    super.width,
    super.flex,
  });

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'options': options,
        'httpData': httpData?.toJson(),
        'optionKey': optionKey,
        'optionLabel': optionLabel,
        'onChangeActions': onChangeActions.map((e) => e.toMap()).toList(),
        'dependsOn': dependsOn,
        'search_live': searchLive,
        if (searchLiveLimit != null) 'search_live_limit': searchLiveLimit,
        if (searchLiveParameter != null)
          'search_live_parameter': searchLiveParameter,
      };
}
