import 'dart:core';

import 'package:appointment/src/app/view/widget/drop_down_items/production_machine.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/production_stage.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_machine_query/production_machine_query_bloc.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_stage_process/production_stage_process_bloc.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_stage_query/production_stage_query_bloc.dart';
import 'package:flexurio_chiron_production/src/app/bloc/production_sub_stage_query/production_sub_stage_query_bloc.dart';
import 'package:flexurio_chiron_production/src/app/model/production_machine.dart';
import 'package:flexurio_chiron_production/src/app/model/production_stage.dart';
import 'package:flexurio_chiron_production/src/app/model/production_stage_process_detail.dart';
import 'package:flexurio_chiron_production/src/app/model/production_sub_stage.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class ProductStageProcessDetailCreatePage extends StatefulWidget {
  const ProductStageProcessDetailCreatePage._(
    this.onSubmitForm,
    this.showOrderField,
    this.onSuccess,
    this.stageProcessDetail,
  );

  final void Function(BuildContext, List<ProductionStageProcessDetail>)
      onSubmitForm;
  final void Function(List<ProductionStageProcessDetail> stageProcessDetail)?
      onSuccess;
  final bool showOrderField;
  final ProductionStageProcessDetail? stageProcessDetail;

  static Route<ProductionStageProcessDetail?> route({
    required void Function(
      BuildContext,
      List<ProductionStageProcessDetail>,
    ) onSubmitForm,
    required bool showOrderField,
    void Function(List<ProductionStageProcessDetail> stageProcessDetail)?
        onSuccess,
    ProductionStageProcessDetail? stageProcessDetail,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductionStageQueryBloc()
              ..add(
                ProductionStageQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => ProductionStageProcessBloc(),
          ),
          BlocProvider(
            create: (context) => ProductionSubStageQueryBloc(),
          ),
          BlocProvider(
            create: (context) => ProductionMachineQueryBloc()
              ..add(
                ProductionMachineQueryEvent.get(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
        ],
        child: ProductStageProcessDetailCreatePage._(
          onSubmitForm,
          showOrderField,
          onSuccess,
          stageProcessDetail,
        ),
      ),
    );
  }

  @override
  State<ProductStageProcessDetailCreatePage> createState() =>
      _ProductionStageProcessCreatePageState();
}

class _ProductionStageProcessCreatePageState
    extends State<ProductStageProcessDetailCreatePage> {
  late DataAction _action;
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _leadTimeControllers = [];
  final _orderController = TextEditingController();
  final _leadTimeController = TextEditingController();
  final _subStageController = TextEditingController();
  final List<ProductionSubStage> _subStages = [];
  late bool _isChange;

  ProductionStage? _stage;
  ProductionSubStage? _subStage;
  ProductionMachine? _machine;

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.stageProcessDetail);
    _isChange = false;
    if (_action.isEdit) {
      final stageProcessDetail = widget.stageProcessDetail!;
      _leadTimeController.text = stageProcessDetail.leadTime.format();
      _subStageController.text = stageProcessDetail.subStage.name;
      for (final leadTimeController in _leadTimeControllers) {
        _leadTimeControllers.add(TextEditingController());
        leadTimeController.text = stageProcessDetail.leadTime.format();
      }
      _orderController.text = stageProcessDetail.order.toString();
      _stage = stageProcessDetail.stage;
      _subStage = stageProcessDetail.subStage;
      _machine = stageProcessDetail.machine;
      context.read<ProductionSubStageQueryBloc>().add(
            ProductionSubStageQueryEvent.fetchById(
              subStage: stageProcessDetail.subStage,
            ),
          );
    }

    if (!widget.showOrderField) {
      _orderController.text = '0';
    }
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final details = _buildStageProcess(widget.stageProcessDetail?.id ?? 0);
      if (details.isNotEmpty) {
        widget.onSubmitForm(context, details);
      }
    }
  }

  List<ProductionStageProcessDetail> _buildStageProcess(int id) {
    final details = <ProductionStageProcessDetail>[];

    if (widget.stageProcessDetail != null) {
      final leadTime = double.tryParse(_leadTimeController.text);
      if (leadTime != null) {
        details.add(
          ProductionStageProcessDetail(
            id: widget.stageProcessDetail!.id,
            leadTime: leadTime,
            machine: _machine ?? widget.stageProcessDetail!.machine,
            stage: _stage ?? widget.stageProcessDetail!.stage,
            subStage: _subStage ?? widget.stageProcessDetail!.subStage,
            order: stringToInt(_orderController.text),
          ),
        );
      }
    } else {
      for (var i = 0; i < _subStages.length; i++) {
        final leadTime = double.tryParse(_leadTimeControllers[i].text);
        if (leadTime != null) {
          details.add(
            ProductionStageProcessDetail(
              id: id,
              leadTime: leadTime,
              machine: _machine!,
              stage: _stage!,
              subStage: _subStages[i],
              order: stringToInt(_orderController.text),
            ),
          );
        }
      }
    }

    return details;
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.productionStageProcessDetail;
    return BlocListener<ProductionStageProcessBloc,
        ProductionStageProcessState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (id) {
            widget.onSuccess?.call(_buildStageProcess(id));
            Toast(context).dataChanged(_action, entity);
            Navigator.pop(context);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          actions: [
            BlocBuilder<ProductionStageProcessBloc,
                ProductionStageProcessState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    orElse: () => false,
                    loading: () => true,
                  ),
                  action: _action,
                  onPressed: () => _submit(context),
                );
              },
            ),
          ],
          formKey: _formKey,
          action: _action,
          entity: entity,
          children: [
            Column(
              children: [
                if (widget.showOrderField)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: FTextFormField(
                      labelText: 'Order',
                      controller: _orderController,
                      validator: requiredValidator.call,
                      inputFormatters: [ThousandsFormatter()],
                    ),
                  ),
                FDropDownSearchProductionMachine(
                  initialValue: _machine,
                  onChanged: (value) {
                    if (value != null) {
                      _machine = value;
                    }
                  },
                ),
                const SizedBox(height: 24),
                FDropDownSearchProductionStage(
                  initialValue: _stage,
                  onChanged: (value) {
                    _isChange = true;
                    if (value != null) {
                      _stage = value;
                      context.read<ProductionSubStageQueryBloc>().add(
                            ProductionSubStageQueryEvent.fetch(
                              stage: value,
                              isActive: true,
                            ),
                          );
                      setState(() {});
                    }
                  },
                ),
                const SizedBox(height: 24),
                if (_action.isCreate || _isChange)
                  BlocBuilder<ProductionSubStageQueryBloc,
                      ProductionSubStageQueryState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loading: CupertinoActivityIndicator.new,
                        error: (error) => const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                        orElse: SizedBox.shrink,
                        loaded: (subStage) {
                          _subStages
                            ..clear()
                            ..addAll(subStage);
                          return Column(
                            children: [
                              ...List.generate(
                                subStage.length,
                                (index) {
                                  _subStage = subStage[index];
                                  for (var i = 0; i < subStage.length; i++) {
                                    _leadTimeControllers
                                        .add(TextEditingController());
                                  }
                                  return Column(
                                    children: [
                                      RowFields(
                                        children: [
                                          FTextFormField(
                                            labelText: 'Production Sub Stage',
                                            enabled: false,
                                            controller: TextEditingController(
                                              text: _subStage!.name,
                                            ),
                                          ),
                                          FTextFormField(
                                            labelText: 'Standar Manhour',
                                            controller: index <
                                                    _leadTimeControllers.length
                                                ? _leadTimeControllers[index]
                                                : null,
                                            inputFormatters: [
                                              currencyFormatter,
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 24),
                                    ],
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                if (_action.isEdit && !_isChange)
                  RowFields(
                    children: [
                      FTextFormField(
                        labelText: 'Production Sub Stage',
                        enabled: false,
                        controller: _subStageController,
                      ),
                      FTextFormField(
                        labelText: 'Standar Manhour',
                        controller: _leadTimeController,
                        inputFormatters: [currencyFormatter],
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SubStageField extends StatefulWidget {
  const SubStageField({
    required this.subStage,
    required this.standarManhour,
    required this.leadController,
    super.key,
  });

  final String subStage;
  final double standarManhour;
  final TextEditingController leadController;

  @override
  State<SubStageField> createState() => _SubStageFieldState();
}

class _SubStageFieldState extends State<SubStageField> {
  late TextEditingController _subStageController;
  late TextEditingController _standarManhourController;

  @override
  void initState() {
    _standarManhourController = widget.leadController;
    _subStageController = TextEditingController(text: widget.subStage);
    _standarManhourController = TextEditingController(
      text: widget.standarManhour.format(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _subStageController.dispose();
    _standarManhourController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        RowFields(
          children: [
            FTextFormField(
              labelText: 'Production Sub Stage',
              enabled: false,
              controller: _subStageController,
            ),
            FTextFormField(
              labelText: 'Standar Manhour',
              controller: _standarManhourController,
              inputFormatters: [
                currencyFormatter,
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
