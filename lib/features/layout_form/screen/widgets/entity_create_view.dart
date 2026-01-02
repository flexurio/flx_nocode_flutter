import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';

import 'package:flx_nocode_flutter/features/layout_form/domain/extensions/layout_form_extensions.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/type.dart';
import 'package:flx_nocode_flutter/src/app/bloc/entity/entity_bloc.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/enitty_create_form/enitty_create_form.dart';
import 'package:flx_nocode_flutter/src/app/view/page/entity_create/widgets/entity_create_layouts.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:flx_nocode_flutter/features/layout_form/screen/controllers/create_page_controller.dart';
import 'package:get/get.dart';

class CreateForm extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return GetBuilder<CreatePageController>(
      tag: 'create_page_${layoutForm.id}',
      builder: (controller) {
        final theme = Theme.of(context);
        final coreEntity = entity.coreEntity;

        return BlocListener<EntityBloc, EntityState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (_) {
                onSuccess();
                Toast(context).dataChanged(controller.action, coreEntity);
                if (autoBackWhenSuccess) {
                  Navigator.pop(context, true);
                } else {
                  controller.clearForm();
                }
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: popup
              ? Form(
                  key: controller.formKey,
                  child: CardForm(
                    popup: true,
                    width: width ?? 400,
                    title: controller.title,
                    icon: layoutForm.formType.isHome
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
                      _buildButtonSubmit(context, controller),
                    ],
                    child: _buildFormContent(controller),
                  ),
                )
              : (noHeader
                  ? EntityCreateEmbeddedLayout(
                      formKey: controller.formKey,
                      form: _buildFormContent(controller),
                      submitButton: _buildButtonSubmit(context, controller),
                    )
                  : EntityCreatePanelLayout(
                      embedded: embedded,
                      theme: theme,
                      formKey: controller.formKey,
                      form: _buildFormContent(controller),
                      submitButton: _buildButtonSubmit(context, controller),
                      coreEntity: coreEntity,
                      title: controller.title,
                      action: layoutForm.formType.isHome
                          ? DataAction.reprocess
                          : controller.action,
                      suffixText: controller.headerSuffix,
                    )),
        );
      },
    );
  }

  Widget _buildFormContent(CreatePageController controller) {
    if (layoutForm.multiForms.isNotEmpty) {
      return Obx(() => MultiForm(
            page: controller.currentPage.value,
            titles: layoutForm.multiForms.map((e) => e.label).toList(),
            children: List.generate(layoutForm.multiForms.length, (index) {
              final stepForm = layoutForm.multiForms[index];
              return Form(
                key: controller.stepFormKeys[index],
                child: EntityCreateForm(
                  key: ValueKey('step_$index'),
                  parentData: parentData,
                  layoutForm: stepForm,
                  entity: entity,
                  dataAction: controller.action,
                  controllers: controller.controllers,
                ),
              );
            }),
          ));
    }

    return Obx(() => EntityCreateForm(
          key: ValueKey(controller.formVersion.value),
          parentData: parentData,
          layoutForm: layoutForm,
          entity: entity,
          dataAction: controller.action,
          controllers: controller.controllers,
        ));
  }

  List<Widget> _buildButtonActions(
      BuildContext context, CreatePageController controller) {
    final actions = <Widget>[];
    final buttons = layoutForm.buttons;
    for (final button in buttons) {
      actions.add(
        Button.string(
          permission: null,
          onPressed: () => controller.executeAction(
              context, button.method, button.url, button.label),
          action: button.label,
          isInProgress: false,
        ),
      );
    }
    return actions;
  }

  Widget _buildButtonSubmit(
      BuildContext context, CreatePageController controller) {
    return BlocBuilder<EntityBloc, EntityState>(
      builder: (context, state) {
        final inProgress =
            state.maybeWhen(loading: () => true, orElse: () => false);

        if (layoutForm.multiForms.isNotEmpty) {
          return Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (controller.currentPage.value > 0)
                    Button.string(
                      permission: null,
                      isInProgress: false,
                      action: 'Back',
                      isSecondary: true,
                      onPressed: controller.prevStep,
                    ),
                  const Gap(10),
                  if (controller.currentPage.value <
                      layoutForm.multiForms.length - 1)
                    Button.string(
                      permission: null,
                      isInProgress: false,
                      action: 'Next',
                      onPressed: controller.nextStep,
                    )
                  else
                    Button.action(
                      permission: null,
                      isInProgress: inProgress,
                      onPressed: () => controller.submit(context),
                      action: layoutForm.formType.isHome
                          ? DataAction.reprocess
                          : controller.action,
                    ),
                ],
              ));
        }

        if (layoutForm.buttons.isNotEmpty) {
          return Row(
            children: _buildButtonActions(context, controller),
          );
        }

        return Button.action(
          permission: null,
          isInProgress: inProgress,
          onPressed: () => controller.submit(context),
          action: layoutForm.formType.isHome
              ? DataAction.reprocess
              : controller.action,
        );
      },
    );
  }
}
