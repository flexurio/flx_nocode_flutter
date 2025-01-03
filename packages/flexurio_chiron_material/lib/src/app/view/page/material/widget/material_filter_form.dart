import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialFilterForm extends StatefulWidget {
  const MaterialFilterForm({
    required this.materialQueryBloc,
    required this.materialGroupQueryBloc,
    super.key,
    this.closeWhenSubmitted = false,
  });

  final MaterialGroupQueryBloc materialGroupQueryBloc;
  final MaterialQueryBloc materialQueryBloc;
  final bool closeWhenSubmitted;

  @override
  State<MaterialFilterForm> createState() => _MaterialFilterFormState();
}

class _MaterialFilterFormState extends State<MaterialFilterForm> {
  final _formKey = GlobalKey<FormState>();
  MaterialGroup? _materialGroup;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (_materialGroup != null) {
        widget.materialQueryBloc.add(
          MaterialQueryEvent.fetch(
            materialGroup: _materialGroup,
          ),
        );
      }
    }
    if (widget.closeWhenSubmitted) {
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocBuilder<MaterialQueryBloc, MaterialQueryState>(
        bloc: widget.materialQueryBloc,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Filter',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              BlocBuilder<MaterialGroupQueryBloc, MaterialGroupQueryState>(
                bloc: widget.materialGroupQueryBloc,
                builder: (context, state) {
                  return FDropDownSearch<MaterialGroup>(
                    status: state.maybeWhen(
                      error: (_) => Status.error,
                      loading: (_) => Status.progress,
                      orElse: () => Status.loaded,
                    ),
                    labelText: 'Material Group',
                    items: state.maybeWhen(
                      orElse: () => [],
                      loaded: (materialGroup) => materialGroup.data,
                    ),
                    onChanged: (value) {
                      if (value != null) {
                        _materialGroup = value;
                      }
                    },
                    itemAsString: (materialGroup) => materialGroup.id,
                  );
                },
              ),
              const SizedBox(height: 12),
              BlocBuilder<MaterialQueryBloc, MaterialQueryState>(
                bloc: widget.materialQueryBloc,
                builder: (context, state) {
                  return Button(
                    action: DataAction.applyFilter,
                    permission: null,
                    onPressed: state.maybeWhen(
                      orElse: () => _submit,
                      loading: (_) => null,
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
