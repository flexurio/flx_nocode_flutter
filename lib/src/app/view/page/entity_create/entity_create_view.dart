import 'package:easy_localization/easy_localization.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/enitty_create_form/enitty_create_form_old.dart';
import 'package:flx_nocode_flutter/features/field/domain/extensions/entity_field_extensions.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:flx_nocode_flutter/features/field/presentation/utils/entity_field_form_controllers.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/extensions/layout_form_extensions.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/type.dart';
import 'package:flx_nocode_flutter/src/app/bloc/entity/entity_controller.dart';
import 'package:flx_nocode_flutter/src/app/view/page/entity_create/widgets/entity_create_layouts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EntityCreateView extends StatefulWidget {
  const EntityCreateView({
    super.key,
    required this.data,
    required this.entity,
    required this.onSuccess,
    required this.embedded,
    required this.autoBackWhenSuccess,
    this.filters = const {},
    required this.noHeader,
    required this.layoutForm,
    required this.parentData,
  });

  final Map<String, dynamic>? data;
  final List<Map<String, dynamic>> parentData;
  final EntityCustom entity;
  final void Function(Map<String, dynamic>? data) onSuccess;
  final Map<String, dynamic> filters;
  final bool embedded;
  final bool autoBackWhenSuccess;
  final bool noHeader;
  final LayoutForm layoutForm;

  @override
  State<EntityCreateView> createState() => _EntityCreateViewState();
}

class _EntityCreateViewState extends State<EntityCreateView> {
  final _formKey = GlobalKey<FormState>();
  var _controllers = <String, TextEditingController>{};
  late DataAction _action;

  @override
  void initState() {
    super.initState();

    _controllers = widget.entity.fields.generateControllers();

    _action = createOrEdit(widget.data);
    if (_action.isEdit) {
      for (final field in widget.entity.fields) {
        _controllers[field.reference]!.text =
            widget.data![field.reference] is num
                ? (widget.data![field.reference] as num).toStringAsFixed(0)
                : widget.data![field.reference].toString();
      }
    }
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coreEntity = widget.entity.coreEntity;
    final headerSuffix = _headerSuffix();
    final form = EntityCreateFormOld(
      parentData: widget.parentData,
      layoutForm: widget.layoutForm,
      entity: widget.entity,
      dataAction: _action,
      controllers: _controllers,
    );

    final controller = Get.find<EntityController>(
        tag: 'entity_ctrl_old_${widget.layoutForm.id}');

    return Obx(() {
      final state = controller.state;
      state.maybeWhen(
        success: (data) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (controller.state is Success) {
              widget.onSuccess(data);
              Toast(context).dataChanged(_action, coreEntity);
              if (widget.autoBackWhenSuccess) Navigator.pop(context, true);
              controller.reset();
            }
          });
        },
        error: (error) => WidgetsBinding.instance.addPostFrameCallback((_) {
          Toast(context).fail(error);
        }),
        orElse: () {},
      );

      return widget.noHeader
          ? EntityCreateEmbeddedLayout(
              formKey: _formKey,
              form: form,
              submitButton: _buildButtonSubmit(controller),
            )
          : EntityCreatePanelLayout(
              embedded: widget.embedded,
              theme: theme,
              formKey: _formKey,
              form: form,
              submitButton: _buildButtonSubmit(controller),
              coreEntity: coreEntity,
              title: _buildTitle(),
              action: widget.layoutForm.formType.isHome
                  ? DataAction.reprocess
                  : _action,
              suffixText: headerSuffix,
            );
    });
  }

  String _buildTitle() {
    final baseTitle = '${_action.title} ${widget.entity.coreEntity.title}';
    final label = widget.layoutForm.label.trim();
    if (widget.layoutForm.formType.isHome && label.isNotEmpty) return label;
    return baseTitle;
  }

  String _headerSuffix() {
    if (!widget.layoutForm.formType.isHome) return '';
    final baseTitle = '${_action.title} ${widget.entity.coreEntity.title}';
    final label = widget.layoutForm.label.trim();
    if (label.isEmpty) return '';
    if (label.toLowerCase() == baseTitle.toLowerCase()) return '';
    return label;
  }

  String _dateFormat(EntityField field) => field.dateTimeFormat;

  String _formatDateTimeField(EntityField field, String value) {
    if (value.isEmpty) return value;

    final fmt = _dateFormat(field);
    final formatter = DateFormat(fmt);

    // Try parsing with configured format first, then fall back to ISO parsing.
    DateTime? parsed;
    try {
      parsed = formatter.parse(value);
    } catch (_) {
      parsed = DateTime.tryParse(value);
    }

    if (parsed == null) return value;
    return formatter.format(parsed);
  }

  Map<String, dynamic> get _data {
    final data = <String, dynamic>{};
    for (final field in widget.entity.fields) {
      if (field.reference != 'id' && (field.autoGenerated ?? false)) {
        continue;
      }

      var value = _controllers[field.reference]!.text;
      if (field.isDateTime) {
        value = _formatDateTimeField(field, value);
      }
      data[field.reference] = value;
    }
    return data;
  }

  void _submit(EntityController controller) {
    if (_formKey.currentState!.validate()) {
      if (_action.isEdit || widget.layoutForm.formType.isHome) {
        controller.edit(data: _data, filters: widget.filters);
      } else {
        controller.create(data: _data, filters: widget.filters);
      }
    }
  }

  List<Widget> _buildButtonActions(
      BuildContext context, EntityController controller) {
    final actions = <Widget>[];
    final buttons = widget.layoutForm.buttons;
    for (final button in buttons) {
      actions.add(
        Button.string(
          permission: null,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              controller.execute(
                data: _data,
                method: button.method,
                url: button.url,
                filters: widget.filters,
              );
            }
          },
          action: button.label,
          isInProgress: false,
        ),
      );
    }
    return actions;
  }

  Widget _buildButtonSubmit(EntityController controller) {
    return Obx(() {
      final state = controller.state;
      final inProgress = state.maybeWhen(
        loading: () => true,
        orElse: () => false,
      );

      if (widget.layoutForm.buttons.isNotEmpty) {
        return Row(
          children: _buildButtonActions(context, controller),
        );
      }

      return Button.action(
        permission: null,
        isInProgress: inProgress,
        onPressed: () => _submit(controller),
        action:
            widget.layoutForm.formType.isHome ? DataAction.reprocess : _action,
      );
    });
  }
}
