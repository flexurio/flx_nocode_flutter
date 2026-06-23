import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

abstract class ComponentInputBase extends Component {
  final String label;
  final bool required;
  final bool enabled;
  final List<String> dependsOn;
  final ComponentSizeMode? widthMode;
  final double? width;
  final int? flex;

  ComponentInputBase({
    required super.id,
    required super.type,
    super.visibilityCondition,
    super.events,
    required this.label,
    this.required = false,
    this.enabled = true,
    this.dependsOn = const [],
    this.widthMode,
    this.width,
    this.flex,
  });

  @override
  JsonMap toMap() => {
        ...super.toMap(),
        'label': label,
        'required': required,
        'enabled': enabled,
        'dependsOn': dependsOn,
        if (widthMode != null) 'widthMode': widthMode?.name,
        if (width != null) 'width': width,
        if (flex != null) 'flex': flex,
      };
}
