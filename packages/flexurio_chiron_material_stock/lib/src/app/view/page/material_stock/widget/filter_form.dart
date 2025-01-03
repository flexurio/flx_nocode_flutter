import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_stock_query/material_stock_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({
    required this.materialStockBloc,
    required this.materialGroupBloc,
    required this.materialBloc,
    super.key,
    this.closeWhenSubmitted = false,
  });

  final MaterialStockQueryBloc materialStockBloc;
  final MaterialGroupQueryBloc materialGroupBloc;
  final MaterialQueryBloc materialBloc;
  final bool closeWhenSubmitted;
  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  final _formKey = GlobalKey<FormState>();
  String? _na;
  MaterialGroup? _materialGroup;
  model.Material? _material;
  DateTime _period = DateTime.now();
  final _periodController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.materialStockBloc.add(
        MaterialStockQueryEvent.fetch(
          period: _period,
          materialGroup: _materialGroup,
          material: _material,
          na: _na,
        ),
      );
      if (widget.closeWhenSubmitted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _period = DateTime.now();
    _periodController.text = _period.yMMMM;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Filter',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          FieldMonthPicker(
            controller: _periodController,
            labelText: 'period'.tr(),
            maxDate: DateTime.now(),
            validator: requiredObjectValidator.call,
            onChanged: (value) => _period = value,
            initialSelectedDate: _period,
          ),
          const SizedBox(height: 12),
          BlocBuilder<MaterialGroupQueryBloc, MaterialGroupQueryState>(
            bloc: widget.materialGroupBloc,
            builder: (context, state) {
              return FDropDownSearch<MaterialGroup>(
                status: state.maybeWhen(
                  error: (_) => Status.error,
                  loading: (_) => Status.progress,
                  orElse: () => Status.loaded,
                ),
                labelText: 'material_group'.tr(),
                items: state.maybeWhen(
                  orElse: () => [],
                  loaded: (materialGroup) => materialGroup.data,
                ),
                onChanged: (value) {
                  if (value != null) {
                    _materialGroup = value;
                  }
                  if (_materialGroup != null) {
                    widget.materialBloc.add(
                      MaterialQueryEvent.fetchByMaterialGroup(
                        id: _materialGroup!.id,
                      ),
                    );
                  }
                },
                itemAsString: (materialGroup) => materialGroup.id,
              );
            },
          ),
          const SizedBox(height: 12),
          BlocBuilder<MaterialQueryBloc, MaterialQueryState>(
            bloc: widget.materialBloc,
            builder: (context, state) {
              return FDropDownSearch<model.Material>(
                status: state.maybeWhen(
                  error: (_) => Status.error,
                  loading: (_) => Status.progress,
                  orElse: () => Status.loaded,
                ),
                labelText: 'Material',
                items: state.maybeWhen(
                  orElse: () => [],
                  loaded: (material) => material.data,
                ),
                onChanged: (value) {
                  if (value != null) {
                    _material = value;
                  }
                },
                itemAsString: (material) => material.name,
              );
            },
          ),
          const SizedBox(height: 12),
          BlocBuilder<MaterialStockQueryBloc, MaterialStockQueryState>(
            bloc: widget.materialStockBloc,
            builder: (context, state) {
              return FDropDownSearch<MaterialStock>(
                status: state.maybeWhen(
                  error: (_) => Status.error,
                  loading: (_) => Status.progress,
                  orElse: () => Status.loaded,
                ),
                labelText: 'NA',
                items: state.maybeWhen(
                  orElse: () => [],
                  loaded: (pageOptions) => pageOptions.data,
                ),
                onChanged: (value) {
                  if (value != null) {
                    _na = value.na;
                  }
                },
                itemAsString: (material) => material.na,
              );
            },
          ),
          const SizedBox(height: 12),
          BlocBuilder<MaterialStockQueryBloc, MaterialStockQueryState>(
            bloc: widget.materialStockBloc,
            builder: (context, state) {
              return Button(
                permission: null,
                color: colorScheme.primary,
                onPressed: state.maybeWhen(
                  orElse: () => _submit,
                  loading: (_) => null,
                ),
                action: DataAction.applyFilter,
              );
            },
          ),
        ],
      ),
    );
  }
}
