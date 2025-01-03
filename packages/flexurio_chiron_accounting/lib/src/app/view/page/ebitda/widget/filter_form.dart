import 'package:appointment/constant/area.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/ebitda_query/ebitda_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/ebitda_recap_query/ebitda_recap_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({
    required this.ebitdaQueryBloc,
    required this.ebitdaRecapQueryBloc,
    this.closeWhenSubmitted = false,
    super.key,
  });

  final EbitdaQueryBloc ebitdaQueryBloc;
  final EbitdaRecapQueryBloc ebitdaRecapQueryBloc;
  final bool closeWhenSubmitted;

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  final _formKey = GlobalKey<FormState>();
  final _periodController = TextEditingController();
  var _area = '';

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final period = _periodController.text;
      widget.ebitdaQueryBloc.add(
        EbitdaQueryEvent.fetch(period, _area),
      );
      widget.ebitdaRecapQueryBloc
          .add(EbitdaRecapQueryEvent.fetch(period, _area));

      if (widget.closeWhenSubmitted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    final now = DateFormat('yyyyMM').format(DateTime.now());
    _periodController.text = now;
  }

  @override
  Widget build(BuildContext context) {
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
          const Gap(12),
          FDropDownSearch(
            labelText: 'Area',
            items: area,
            onChanged: (value) => _area = value ?? '',
            itemAsString: (area) => area,
          ),
          const Gap(12),
          FTextFormField(
            controller: _periodController,
            labelText: 'Period',
            maxLength: 6,
            helperText: 'Enter period in format yyyymm only.',
          ),
          const Gap(12),
          BlocBuilder<EbitdaQueryBloc, EbitdaQueryState>(
            bloc: widget.ebitdaQueryBloc,
            builder: (context, state) {
              return Button(
                permission: null,
                onPressed: state.maybeWhen(
                  orElse: () => _submit,
                  loading: () => null,
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
