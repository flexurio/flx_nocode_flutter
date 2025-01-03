import 'package:flexurio_chiron_material_stock/src/app/bloc/material_rates_query/material_retest_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_retest.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart' as ui;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class FilterFormMaterialRetest extends ui.StatefulWidget {
  const FilterFormMaterialRetest({
    required this.materialRetestsBloc,
    super.key,
  });

  static ui.Widget prepare({
    required MaterialRetestQueryBloc materialRetestsBloc,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialQueryBloc(),
        ),
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(MaterialGroupQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
      ],
      child: FilterFormMaterialRetest(
        materialRetestsBloc: materialRetestsBloc,
      ),
    );
  }

  final MaterialRetestQueryBloc materialRetestsBloc;

  @override
  ui.State<FilterFormMaterialRetest> createState() =>
      _FilterFormMaterialRetestState();
}

class _FilterFormMaterialRetestState
    extends ui.State<FilterFormMaterialRetest> {
  MaterialRetestStatus _status = MaterialRetestStatus.empty;
  final _naController = ui.TextEditingController();
  final _formKey = ui.GlobalKey<ui.FormState>();
  late MaterialGroup _category;
  late Material _material;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.materialRetestsBloc.add(
        MaterialRetestQueryEvent.fetch(
          materialGroup: _category,
          material: _material,
          na: _naController.text,
          status: _status.label,
        ),
      );
    }
  }

  @override
  ui.Widget build(ui.BuildContext context) {
    return ui.Form(
      key: _formKey,
      child: ui.Column(
        crossAxisAlignment: ui.CrossAxisAlignment.start,
        children: [
          const ui.Text(
            'Filter',
            style: ui.TextStyle(
              fontSize: 16,
              fontWeight: ui.FontWeight.bold,
            ),
          ),
          const Gap(12),
          BlocBuilder<MaterialGroupQueryBloc, MaterialGroupQueryState>(
            builder: (context, state) {
              return FDropDownSearch<MaterialGroup>(
                validator: requiredObjectValidator.call,
                status: state.maybeWhen(
                  error: (_) => Status.error,
                  loading: (_) => Status.progress,
                  orElse: () => Status.loaded,
                ),
                labelText: 'Material Group',
                items: state.maybeWhen(
                  orElse: () => [],
                  loaded: (category) => category.data,
                ),
                onChanged: (category) {
                  if (category != null) {
                    _category = category;
                    context.read<MaterialQueryBloc>().add(
                          MaterialQueryEvent.fetchByMaterialGroup(
                            id: category.id,
                          ),
                        );
                  }
                },
                itemAsString: (category) => category.id,
              );
            },
          ),
          const Gap(12),
          BlocBuilder<MaterialQueryBloc, MaterialQueryState>(
            builder: (context, state) {
              return FDropDownSearch<Material>(
                validator: requiredObjectValidator.call,
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
                onChanged: (material) {
                  if (material != null) {
                    _material = material;
                  }
                },
                itemAsString: (material) => material.name,
              );
            },
          ),
          const Gap(12),
          FTextFormField(
            labelText: 'NA',
            controller: _naController,
            validator: requiredValidator.call,
            maxLength: 10,
          ),
          const Gap(12),
          FDropDownSearch<MaterialRetestStatus>(
            labelText: 'Status',
            items: const [
              MaterialRetestStatus.retest,
              MaterialRetestStatus.release,
              MaterialRetestStatus.reject,
            ],
            onChanged: (value) {
              if (value != null) {
                _status = value;
              }
            },
            itemAsString: (status) => status.label,
          ),
          const Gap(12),
          BlocBuilder<MaterialRetestQueryBloc, MaterialRetestQueryState>(
            bloc: widget.materialRetestsBloc,
            builder: (context, state) {
              return Button(
                permission: null,
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
