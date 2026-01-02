import 'package:easy_localization/easy_localization.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/component/models/component_date_picker.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text_field.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/field/domain/extensions/entity_field_extensions.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:flx_nocode_flutter/features/field/presentation/utils/entity_field_form_controllers.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/extensions/layout_form_extensions.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/type.dart';
import 'package:flx_nocode_flutter/src/app/bloc/entity/entity_bloc.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CreatePageController extends GetxController {
  CreatePageController({
    required this.entity,
    required this.layoutFormId,
    required this.initialDataInput,
    required this.parentData,
    this.filters = const {},
  });

  final EntityCustom entity;
  final String layoutFormId;
  final Map<String, dynamic>? initialDataInput;
  final List<Map<String, dynamic>> parentData;
  final Map<String, dynamic> filters;

  late LayoutForm layoutForm;

  // State from CreatePageController
  final RxMap<String, dynamic> initialData = <String, dynamic>{}.obs;
  final RxBool hasError = false.obs;
  final RxString errorDescription = ''.obs;

  // State from CreateFormController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<GlobalKey<FormState>> stepFormKeys = [];
  final RxMap<String, TextEditingController> controllers =
      <String, TextEditingController>{}.obs;
  late DataAction action;
  final RxInt formVersion = 0.obs;
  final RxInt currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadLayoutForm();
  }

  @override
  void onClose() {
    for (final c in controllers.values) {
      c.dispose();
    }
    super.onClose();
  }

  // --- Logic from CreatePageController ---

  void _loadLayoutForm() {
    try {
      layoutForm = entity.layoutForm.firstWhere((e) => e.id == layoutFormId);
      _prepareInitialData();

      // Initialize form logic after layout form is loaded
      action = layoutForm.action;
      _initializeControllers();
      _initializeSteps();
    } catch (_) {
      hasError.value = true;
      errorDescription.value =
          'Could not find layout form with id: $layoutFormId';
    }
  }

  void _prepareInitialData() {
    final data = Map<String, dynamic>.from(initialDataInput ?? {});

    if (layoutForm.formType.isCreate || layoutForm.formType.isHome) {
      for (final component in layoutForm.allComponents) {
        if (component is ComponentTextField) {
          if (component.initialValue.isNotEmpty) {
            final val = component.initialValue.interpolateJavascript({
              // ...data,
              'data': data,
              if (parentData.isNotEmpty) 'parent': parentData.last,
            });
            data[component.id] = val;
          } else {
            data.remove(component.id);
          }
        }
      }
    }
    initialData.value = data;
  }

  // --- Logic from CreateFormController ---

  void _initializeControllers() {
    // Generate controllers from entity fields
    final ctrls = entity.fields.generateControllers();

    // Ensure all components have controllers
    for (final component in layoutForm.allComponents) {
      if (!ctrls.containsKey(component.id)) {
        ctrls[component.id] = TextEditingController();
      }
    }

    // Set initial values from the PREPARED initialData
    if (initialData.isNotEmpty) {
      for (final entry in initialData.entries) {
        final ctrl = ctrls[entry.key];
        if (ctrl != null) {
          ctrl.text = entry.value?.toString() ?? '';
        }
      }
    }

    controllers.value = ctrls;
  }

  void _initializeSteps() {
    if (layoutForm.multiForms.isNotEmpty) {
      for (var i = 0; i < layoutForm.multiForms.length; i++) {
        stepFormKeys.add(GlobalKey<FormState>());
      }
    }
  }

  void nextStep() {
    if (stepFormKeys[currentPage.value].currentState!.validate()) {
      currentPage.value++;
    }
  }

  void prevStep() {
    if (currentPage.value > 0) {
      currentPage.value--;
    }
  }

  void clearForm() {
    for (final controller in controllers.values) {
      controller.clear();
    }
    formVersion.value++;
    formKey.currentState?.reset();
  }

  Map<String, dynamic> get currentData {
    final data = <String, dynamic>{};
    final components = layoutForm.allComponents;

    // Create a lookup for fields by reference for easy access to formatting logic
    final fieldMap = {for (final f in entity.fields) f.reference: f};

    for (final component in components) {
      final controller = controllers[component.id];
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
    for (final field in entity.fields) {
      if (!data.containsKey(field.reference)) {
        if (field.reference != 'id' && (field.autoGenerated ?? false)) {
          continue;
        }
        final controller = controllers[field.reference];
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

  String _dateFormat(EntityField field) {
    try {
      return field.dateTimeFormat;
    } catch (_) {
      return 'yyyy-MM-dd HH:mm:ss';
    }
  }

  void submit(BuildContext context) {
    print('[CreateForm] Submitting data: $currentData');

    // For multi-step, validate all steps before submitting
    if (layoutForm.multiForms.isNotEmpty) {
      bool allValid = true;
      for (final key in stepFormKeys) {
        if (key.currentState != null && !key.currentState!.validate()) {
          allValid = false;
        }
      }
      if (!allValid) {
        print('[CreateForm] Multi-step form validation failed');
        return;
      }
    } else if (formKey.currentState != null &&
        !formKey.currentState!.validate()) {
      print('[CreateForm] Form validation failed');
      return;
    }

    // If we are here, validation passed
    late EntityEvent event;
    if (layoutForm.submitWorkflow != null &&
        layoutForm.submitWorkflow!.isNotEmpty) {
      print('[CreateForm] Triggering submitWorkflow');
      event = EntityEvent.submitWorkflow(
        data: currentData,
        workflow: layoutForm.submitWorkflow!,
      );
    } else {
      print('[CreateForm] Submit workflow not found!');
      Toast(context).fail('Submit workflow not found');
      return;
    }

    context.read<EntityBloc>().add(event);
  }

  void executeAction(
      BuildContext context, String method, String? url, String label) {
    if (formKey.currentState!.validate()) {
      final event = EntityEvent.execute(
        data: currentData,
        method: method,
        url: url ?? '',
        filters: filters,
      );
      context.read<EntityBloc>().add(event);
    }
  }

  String get title {
    final baseTitle = '${action.title} ${entity.coreEntity.title}';
    final label = layoutForm.label.trim();
    if (layoutForm.formType.isHome && label.isNotEmpty) return label;
    return baseTitle;
  }

  String get headerSuffix {
    if (!layoutForm.formType.isHome) return '';
    final baseTitle = '${action.title} ${entity.coreEntity.title}';
    final label = layoutForm.label.trim();
    if (label.isEmpty) return '';
    if (label.toLowerCase() == baseTitle.toLowerCase()) return '';
    return label;
  }
}
