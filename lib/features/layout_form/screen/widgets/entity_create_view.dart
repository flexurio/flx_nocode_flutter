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
import 'package:flx_nocode_flutter/features/component/models/component_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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
    this.popup = false,
    this.width,
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
  final bool popup;
  final double? width;

  @override
  State<CreateForm> createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {
  final _formKey = GlobalKey<FormState>();
  final List<GlobalKey<FormState>> _stepFormKeys = [];
  var _controllers = <String, TextEditingController>{};
  late DataAction _action;
  int _formVersion = 0;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _controllers = widget.entity.fields.generateControllers();

    // Ensure all components have controllers, even those not strictly bound to fields
    for (final component in widget.layoutForm.allComponents) {
      if (!_controllers.containsKey(component.id)) {
        _controllers[component.id] = TextEditingController();
      }
    }

    if (widget.data != null) {
      for (final entry in widget.data!.entries) {
        final ctrl = _controllers[entry.key];
        if (ctrl != null) {
          ctrl.text = entry.value?.toString() ?? '';
        }
      }
    }

    _action = widget.layoutForm.action;

    if (widget.layoutForm.multiForms.isNotEmpty) {
      for (var i = 0; i < widget.layoutForm.multiForms.length; i++) {
        _stepFormKeys.add(GlobalKey<FormState>());
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
    // remove `final form = ...` logic from here as it's now in _buildFormContent

    return BlocListener<EntityBloc, EntityState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (_) {
            widget.onSuccess();
            Toast(context).dataChanged(_action, coreEntity);
            if (widget.autoBackWhenSuccess) {
              Navigator.pop(context, true);
            } else {
              _clearForm();
            }
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: widget.popup
          ? Form(
              key: _formKey,
              child: CardForm(
                popup: true,
                width: widget.width ?? 400,
                title: _buildTitle(),
                icon: widget.layoutForm.formType.isHome
                    ? Icons.home
                    : Icons.edit_note,
                actions: [
                  Button.action(
                    permission: null,
                    isSecondary: true,
                    onPressed: () => Navigator.pop(context),
                    action: DataAction.cancel,
                  ),
                  const Gap(10),
                  _buildButtonSubmit(),
                ],
                child: _buildFormContent(),
              ),
            )
          : (widget.noHeader
              ? EntityCreateEmbeddedLayout(
                  formKey: _formKey,
                  form: _buildFormContent(),
                  submitButton: _buildButtonSubmit(),
                )
              : EntityCreatePanelLayout(
                  embedded: widget.embedded,
                  theme: theme,
                  formKey: _formKey,
                  form: _buildFormContent(),
                  submitButton: _buildButtonSubmit(),
                  coreEntity: coreEntity,
                  title: _buildTitle(),
                  action: widget.layoutForm.formType.isHome
                      ? DataAction.reprocess
                      : _action,
                  suffixText: headerSuffix,
                )),
    );
  }

  Widget _buildFormContent() {
    if (widget.layoutForm.multiForms.isNotEmpty) {
      return MultiForm(
        page: _currentPage,
        titles: widget.layoutForm.multiForms.map((e) => e.label).toList(),
        children: List.generate(widget.layoutForm.multiForms.length, (index) {
          final stepForm = widget.layoutForm.multiForms[index];
          return Form(
            key: _stepFormKeys[index],
            child: EntityCreateForm(
              key: ValueKey('step_$index'),
              parentData: widget.parentData,
              layoutForm: stepForm,
              entity: widget.entity,
              dataAction: _action,
              controllers: _controllers,
            ),
          );
        }),
      );
    }

    return EntityCreateForm(
      key: ValueKey(_formVersion),
      parentData: widget.parentData,
      layoutForm: widget.layoutForm,
      entity: widget.entity,
      dataAction: _action,
      controllers: _controllers,
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

  Map<String, dynamic> get _data {
    final data = <String, dynamic>{};
    final components = widget.layoutForm.allComponents;

    // Create a lookup for fields by reference for easy access to formatting logic
    final fieldMap = {for (final f in widget.entity.fields) f.reference: f};

    for (final component in components) {
      final controller = _controllers[component.id];
      if (controller == null) continue;

      var value = controller.text;

      // Check if this component is bound to a date field or is a date picker component
      final field = fieldMap[component.id];
      if ((field != null && field.isDateTime) ||
          component is ComponentDatePicker) {
        value = _formatDateTimeField(field, value);
      }

      data[component.id] = value;
    }

    // Also include pure field data that might not be in the components list
    // (e.g. hidden primary keys or auto-generated fields if needed)
    for (final field in widget.entity.fields) {
      if (!data.containsKey(field.reference)) {
        if (field.reference != 'id' && (field.autoGenerated ?? false)) {
          continue;
        }
        final controller = _controllers[field.reference];
        if (controller != null) {
          var value = controller.text;
          if (field.isDateTime) {
            value = _formatDateTimeField(field, value);
          }
          data[field.reference] = value;
        }
      }
    }

    return data;
  }

  String _formatDateTimeField(EntityField? field, String value) {
    if (value.isEmpty) return value;

    final fmt = field != null ? _dateFormat(field) : 'yyyy-MM-dd HH:mm:ss';
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

  void _clearForm() {
    setState(() {
      for (final controller in _controllers.values) {
        controller.clear();
      }
      _formVersion++;
    });
    _formKey.currentState?.reset();
  }

  void _submit() {
    print('[CreateForm] Submitting data: $_data');

    // For multi-step, validate all steps before submitting
    if (widget.layoutForm.multiForms.isNotEmpty) {
      bool allValid = true;
      for (final key in _stepFormKeys) {
        if (key.currentState != null && !key.currentState!.validate()) {
          allValid = false;
        }
      }
      if (!allValid) {
        print('[CreateForm] Multi-step form validation failed');
        return;
      }
    } else if (_formKey.currentState != null &&
        !_formKey.currentState!.validate()) {
      print('[CreateForm] Form validation failed');
      return;
    }

    // If we are here, validation passed
    late EntityEvent event;
    if (widget.layoutForm.submitWorkflow != null &&
        widget.layoutForm.submitWorkflow!.isNotEmpty) {
      print('[CreateForm] Triggering submitWorkflow');
      event = EntityEvent.submitWorkflow(
        data: _data,
        workflow: widget.layoutForm.submitWorkflow!,
      );
    } else {
      print('[CreateForm] Submit workflow not found!');
      Toast(context).fail('Submit workflow not found');
      return;
    }

    context.read<EntityBloc>().add(event);
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
        final inProgress =
            state.maybeWhen(loading: () => true, orElse: () => false);

        if (widget.layoutForm.multiForms.isNotEmpty) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (_currentPage > 0)
                Button.string(
                  permission: null,
                  isInProgress: false,
                  action: 'Back',
                  isSecondary: true,
                  onPressed: _prevStep,
                ),
              const Gap(10),
              if (_currentPage < widget.layoutForm.multiForms.length - 1)
                Button.string(
                  permission: null,
                  isInProgress: false,
                  action: 'Next',
                  onPressed: _nextStep,
                )
              else
                Button.action(
                  permission: null,
                  isInProgress: inProgress,
                  onPressed: _submit,
                  action: widget.layoutForm.formType.isHome
                      ? DataAction.reprocess
                      : _action,
                ),
            ],
          );
        }

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

  void _nextStep() {
    if (_stepFormKeys[_currentPage].currentState!.validate()) {
      setState(() {
        _currentPage++;
      });
    }
  }

  void _prevStep() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
    }
  }
}
