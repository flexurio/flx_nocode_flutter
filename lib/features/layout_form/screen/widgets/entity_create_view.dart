import 'package:easy_localization/easy_localization.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/field/domain/extensions/entity_field_extensions.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:flx_nocode_flutter/features/field/presentation/utils/entity_field_form_controllers.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/extensions/layout_form_extensions.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/type.dart';
import 'package:flx_nocode_flutter/src/app/bloc/entity/entity_bloc.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/enitty_create_form/enitty_create_form.dart';
import 'package:flx_nocode_flutter/src/app/view/page/entity_create/widgets/entity_create_layouts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateForm extends StatefulWidget {
  const CreateForm({
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
  final VoidCallback onSuccess;
  final Map<String, dynamic> filters;
  final bool embedded;
  final bool autoBackWhenSuccess;
  final bool noHeader;
  final LayoutForm layoutForm;

  @override
  State<CreateForm> createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {
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
    final form = EntityCreateForm(
      parentData: widget.parentData,
      layoutForm: widget.layoutForm,
      entity: widget.entity,
      dataAction: _action,
      controllers: _controllers,
    );

    return BlocListener<EntityBloc, EntityState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (_) {
            widget.onSuccess();
            Toast(context).dataChanged(_action, coreEntity);
            if (widget.autoBackWhenSuccess) Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: widget.noHeader
          ? EntityCreateEmbeddedLayout(
              formKey: _formKey,
              form: form,
              submitButton: _buildButtonSubmit(),
            )
          : EntityCreatePanelLayout(
              embedded: widget.embedded,
              theme: theme,
              formKey: _formKey,
              form: form,
              submitButton: _buildButtonSubmit(),
              coreEntity: coreEntity,
              title: _buildTitle(),
              action: widget.layoutForm.formType.isHome
                  ? DataAction.reprocess
                  : _action,
              suffixText: headerSuffix,
            ),
    );
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

  String _dateFormat(EntityField field) {
    try {
      return field.dateTimeFormat;
    } catch (_) {
      return 'yyyy-MM-dd HH:mm:ss';
    }
  }

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

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late EntityEvent event;
      if (widget.layoutForm.submitWorkflow != null &&
          widget.layoutForm.submitWorkflow!.isNotEmpty) {
        event = EntityEvent.submitWorkflow(
          data: _data,
          workflow: widget.layoutForm.submitWorkflow!,
        );
      } else if (_action.isEdit || widget.layoutForm.formType.isHome) {
        event = EntityEvent.edit(data: _data, filters: widget.filters);
      } else {
        event = EntityEvent.create(data: _data, filters: widget.filters);
      }

      context.read<EntityBloc>().add(event);
    }
  }

  List<Widget> _buildButtonActions(BuildContext context) {
    final actions = <Widget>[];
    final buttons = widget.layoutForm.buttons;
    for (final button in buttons) {
      actions.add(
        Button.string(
          permission: null,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final event = EntityEvent.execute(
                data: _data,
                method: button.method,
                url: button.url,
                filters: widget.filters,
              );

              context.read<EntityBloc>().add(event);
            }
          },
          action: button.label,
          isInProgress: false,
        ),
      );
    }
    return actions;
  }

  Widget _buildButtonSubmit() {
    return BlocBuilder<EntityBloc, EntityState>(
      builder: (context, state) {
        final inProgress = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        if (widget.layoutForm.buttons.isNotEmpty) {
          return Row(
            children: _buildButtonActions(context),
          );
        }

        return Button.action(
          permission: null,
          isInProgress: inProgress,
          onPressed: _submit,
          action: widget.layoutForm.formType.isHome
              ? DataAction.reprocess
              : _action,
        );
      },
    );
  }
}
