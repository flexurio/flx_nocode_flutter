import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/field/presentation/utils/entity_field_form_controllers.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/extensions/layout_form_extensions.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/type.dart';
import 'package:flx_nocode_flutter/src/app/bloc/entity/entity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'utils/create_page_controller_utils.dart';

/// A unified controller for managing the state and logic of form creation and editing.
///
/// This controller handles layout form loading, initial data preparation via JS interpolation,
/// form control management (TextEditingControllers), multi-step navigation, and submission.
class CreatePageController extends GetxController {
  /// Creates a [CreatePageController] with the required context.
  ///
  /// [entity] - The business entity definition.
  /// [layoutFormId] - The ID of the layout form configuration to load.
  /// [initialDataInput] - Optional initial data provided by the caller.
  /// [parentData] - Contextual data from parent components/pages.
  /// [filters] - Additional filters used for data retrieval or actions.
  CreatePageController({
    required this.entity,
    required this.layoutFormId,
    required this.initialDataInput,
    required this.parentData,
    this.filters = const {},
  });

  /// The entity template for this form.
  final EntityCustom entity;

  /// Target layout form identifier.
  final String layoutFormId;

  /// Raw initial values input.
  final Map<String, dynamic>? initialDataInput;

  /// Hierarchical context for the form.
  final List<Map<String, dynamic>> parentData;

  /// Global filters for the current context.
  final Map<String, dynamic> filters;

  /// The loaded layout form configuration.
  late LayoutForm layoutForm;

  /// Reactive map containing prepared initial data after JS interpolation.
  final RxMap<String, dynamic> initialData = <String, dynamic>{}.obs;

  /// Indicates if the controller encountered an initialization error.
  final RxBool hasError = false.obs;

  /// Description of the error if [hasError] is true.
  final RxString errorDescription = ''.obs;

  /// Form key for standard (single-page) forms.
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  /// Form keys for multi-step forms, one per step.
  final List<GlobalKey<FormState>> stepFormKeys = [];

  /// Reactive map of field IDs to their respective [TextEditingController]s.
  final RxMap<String, TextEditingController> controllers =
      <String, TextEditingController>{}.obs;

  /// The action type (Create, Update, Home) defined by the layout form.
  late DataAction action;

  /// Version counter used to force UI refreshes when form is cleared.
  final RxInt formVersion = 0.obs;

  /// The current page index for multi-step forms.
  final RxInt currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadLayoutForm();
  }

  @override
  void onClose() {
    // Dispose all managed controllers to prevent memory leaks.
    for (final c in controllers.values) {
      c.dispose();
    }
    super.onClose();
  }

  /// Finds and loads the layout form from the entity definition.
  ///
  /// Triggers initial data preparation and controller initialization.
  void _loadLayoutForm() {
    try {
      layoutForm = entity.layoutForm.firstWhere((e) => e.id == layoutFormId);
      _prepareInitialData();

      action = layoutForm.action;
      _initializeControllers();
      _initializeSteps();
    } catch (_) {
      hasError.value = true;
      errorDescription.value =
          'Could not find layout form with id: $layoutFormId';
    }
  }

  /// Prepares the initial values for the form fields.
  ///
  /// Delegated to [CreatePageControllerUtils.prepareInitialData] to handle
  /// JS interpolation and dummy data clearing for empty initial values.
  void _prepareInitialData() {
    final processedData = CreatePageControllerUtils.prepareInitialData(
      initialDataInput: initialDataInput ?? {},
      components: layoutForm.allComponents,
      parentData: parentData,
    );

    initialData.value = processedData;
  }

  /// Generates and populates [TextEditingController]s for all form fields.
  ///
  /// Uses [entity] field definitions to generate base controllers and then
  /// populates them with the [initialData].
  void _initializeControllers() {
    final ctrls = entity.fields.generateControllers();

    // Ensure all UI components have a managed controller.
    for (final component in layoutForm.allComponents) {
      if (!ctrls.containsKey(component.id)) {
        ctrls[component.id] = TextEditingController();
      }
    }

    // Apply prepared initial values to controllers.
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

  /// Prepares form keys for multi-step layouts.
  void _initializeSteps() {
    if (layoutForm.multiForms.isNotEmpty) {
      for (var i = 0; i < layoutForm.multiForms.length; i++) {
        stepFormKeys.add(GlobalKey<FormState>());
      }
    }
  }

  /// Navigates to the next form step after validating the current one.
  void nextStep() {
    if (stepFormKeys[currentPage.value].currentState!.validate()) {
      currentPage.value++;
    }
  }

  /// Navigates back to the previous form step.
  void prevStep() {
    if (currentPage.value > 0) {
      currentPage.value--;
    }
  }

  /// Resets the form by clearing all controllers and resetting the validation state.
  void clearForm() {
    for (final controller in controllers.values) {
      controller.clear();
    }
    formVersion.value++;
    formKey.currentState?.reset();
  }

  /// Extracts the current user input as a map, formatted for external consumption.
  ///
  /// Delegated to [CreatePageControllerUtils.extractCurrentData].
  Map<String, dynamic> get currentData {
    return CreatePageControllerUtils.extractCurrentData(
      components: layoutForm.allComponents,
      fields: entity.fields,
      controllers: controllers,
    );
  }

  /// Validates the form and triggers the submit workflow defined in the layout form.
  ///
  /// Supports both standard and multi-step validation.
  void submit(BuildContext context) {
    if (layoutForm.multiForms.isNotEmpty) {
      bool allValid = true;
      for (final key in stepFormKeys) {
        if (key.currentState != null && !key.currentState!.validate()) {
          allValid = false;
        }
      }
      if (!allValid) return;
    } else if (formKey.currentState != null &&
        !formKey.currentState!.validate()) {
      return;
    }

    if (layoutForm.submitWorkflow != null &&
        layoutForm.submitWorkflow!.isNotEmpty) {
      final event = EntityEvent.submitWorkflow(
        form: currentData,
        data: initialDataInput ?? {},
        workflow: layoutForm.submitWorkflow!,
      );

      context.read<EntityBloc>().add(event);
    } else {
      Toast(context).fail('Submit workflow not found');
    }
  }

  /// Executes a custom entity action (e.g., HTTP request) using current form data.
  ///
  /// [method] - HTTP method (GET, POST, etc.)
  /// [url] - Target endpoint.
  /// [label] - Tracking or UI label for the action.
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

  /// Computes the display title for the page based on the current action and label.
  String get title {
    final baseTitle = '${action.title} ${entity.coreEntity.title}';
    final label = layoutForm.label.trim();
    if (layoutForm.formType.isHome && label.isNotEmpty) return label;
    return baseTitle;
  }

  /// Computes a suffix for the header, often used for additional context in Home forms.
  String get headerSuffix {
    if (!layoutForm.formType.isHome) return '';
    final baseTitle = '${action.title} ${entity.coreEntity.title}';
    final label = layoutForm.label.trim();
    if (label.isEmpty) return '';
    if (label.toLowerCase() == baseTitle.toLowerCase()) return '';
    return label;
  }
}
