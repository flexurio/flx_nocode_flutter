import 'package:flexurio_chiron_product/src/app/bloc/product_query/bloc/product_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ScheduleCreatePage extends StatefulWidget {
  const ScheduleCreatePage({
    super.key,
    this.schedule,
  });

  final Schedule? schedule;

  static Widget prepare({
    required bool isExternal, Schedule? schedule,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ScheduleBloc(
                  isExternal: isExternal,
                ),),
        BlocProvider(
          create: (context) => ScheduleQueryBloc(
            isExternal: isExternal,
          )..add(
              ScheduleQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: false)
            ..add(
              ProductQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        // TODO(suhal): don't hardcode
        BlocProvider(
          create: (context) => ProductionOrderQueryBloc(isExternal: false),
        ),
        BlocProvider(
          create: (context) => WorkHourShiftQueryBloc()
            ..add(const WorkHourShiftQueryEvent.get()),
        ),
        BlocProvider(
          create: (context) => ProductionStageProcessQueryBloc(),
        ),
      ],
      child: ScheduleCreatePage(
        schedule: schedule,
      ),
    );
  }

  @override
  State<ScheduleCreatePage> createState() => _ScheduleCreatePageState();
}

class _ScheduleCreatePageState extends State<ScheduleCreatePage> {
  final _formKey = GlobalKey<FormState>();
  late DataAction _action;
  late Product _product;
  late ProductionOrder _batch;
  late DateTime _startTime;
  late List<ProductionStageProcess> _stageProcess = [];

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.schedule);

    if (_action.isEdit) {
      context.read<ProductionStageProcessQueryBloc>().add(
            ProductionStageProcessQueryEvent.fetch(
              product: widget.schedule?.product,
              type: widget.schedule?.productionStageProcess.type.id,
              pageOptions: PageOptions.emptyNoLimit(),
            ),
          );
      context.read<ProductionOrderQueryBloc>().add(
            ProductionOrderQueryEvent.fetch(
              product: widget.schedule?.product,
              pageOptions: PageOptions.emptyNoLimit(),
            ),
          );
      _product = widget.schedule!.product;
      _batch = widget.schedule!.productionOrder;
      _startTime = widget.schedule!.startTime;
    }
  }

  void _submit() {
    final sortedStageProcess = _stageProcess
      ..sort((a, b) => a.ordinal.compareTo(b.ordinal));
    if (_formKey.currentState!.validate()) {
      if (_action.isEdit) {
        if (_stageProcess.isNotEmpty) {
          context.read<ScheduleBloc>().add(
                ScheduleEvent.edit(
                  schedule: widget.schedule!,
                  productionOrder: _batch,
                  stageProcess: sortedStageProcess,
                  product: _product,
                  startTime: _startTime,
                ),
              );
        } else {
          Toast(context).fail('Stage Process not Found');
        }
      } else {
        if (_stageProcess.isNotEmpty) {
          context.read<ScheduleBloc>().add(
                ScheduleEvent.create(
                  productionOrder: _batch,
                  stageProcess: sortedStageProcess,
                  product: _product,
                  startTime: _startTime,
                ),
              );
        } else {
          Toast(context).fail('Stage Process not Found');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.schedule;
    return BlocListener<ScheduleBloc, ScheduleState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) => Toast(context).fail(error),
          success: () {
            Toast(context).dataChanged(_action, entity);
            Navigator.pop(context, true);
          },
        );
      },
      child: BlocListener<ProductionStageProcessQueryBloc,
          ProductionStageProcessQueryState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () => <ProductionStageProcess>[],
            loaded: (stageProcess, _) {
              _stageProcess = List.from(stageProcess.data);
            },
          );
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleFormPanel(
            actions: [
              BlocBuilder<ScheduleBloc, ScheduleState>(
                builder: (context, state) {
                  return Button(
                    permission: null,
                    isInProgress: state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    ),
                    onPressed: _submit,
                    action: _action,
                  );
                },
              ),
            ],
            formKey: _formKey,
            action: _action,
            entity: entity,
            children: [
              BlocBuilder<ProductQueryBloc, ProductQueryState>(
                builder: (context, state) {
                  return FDropDownSearch<Product>(
                    status: state.maybeWhen(
                      error: (_) => Status.error,
                      loading: (_) => Status.progress,
                      orElse: () => Status.loaded,
                    ),
                    itemAsString: (product) => product.name,
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (products) => products.data,
                    ),
                    initialValue: widget.schedule?.product,
                    onChanged: (value) {
                      if (value != null) {
                        _product = value;
                        context.read<ProductionOrderQueryBloc>().add(
                              ProductionOrderQueryEvent.fetch(
                                product: value,
                                pageOptions: PageOptions.emptyNoLimit(),
                              ),
                            );
                        setState(() {});
                      }
                    },
                    labelText: 'Product',
                    validator: requiredObjectValidator.call,
                  );
                },
              ),
              const Gap(24),
              BlocBuilder<ProductionOrderQueryBloc, ProductionOrderQueryState>(
                builder: (context, state) {
                  return FDropDownSearch<ProductionOrder>(
                    status: state.maybeWhen(
                      error: (_) => Status.error,
                      loading: (_) => Status.progress,
                      orElse: () => Status.loaded,
                    ),
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (productionOrders) => productionOrders.data,
                    ),
                    itemAsString: (productionOrder) => productionOrder.id,
                    initialValue: widget.schedule?.productionOrder,
                    onChanged: (value) {
                      if (value != null) {
                        _batch = value;
                        var type = 'REGULER';
                        if (_batch.productStatus.id == 'RUAHAN') {
                          type = 'RUAHAN';
                        }
                        context.read<ProductionStageProcessQueryBloc>().add(
                              ProductionStageProcessQueryEvent.fetch(
                                product: _product,
                                type: type,
                                pageOptions: PageOptions.emptyNoLimit(),
                              ),
                            );
                        setState(() {});
                      }
                    },
                    labelText: 'Batch',
                    validator: requiredObjectValidator.call,
                  );
                },
              ),
              const Gap(24),
              FieldDatePicker(
                labelText: 'Schedule Start',
                initialSelectedDate: widget.schedule?.startTime,
                controller: TextEditingController(),
                validator: requiredObjectValidator.call,
                onChanged: (value) => _startTime = value,
                minDate: DateTime.now(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
