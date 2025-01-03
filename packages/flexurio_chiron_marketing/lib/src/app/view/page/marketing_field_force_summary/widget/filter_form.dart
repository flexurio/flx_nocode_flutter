import 'package:flexurio_chiron_marketing/flexurio_chiron_marketing.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class FilterForm extends StatefulWidget {
  const FilterForm({
    required this.summaryBloc,
    required this.filterBloc,
    required this.summaryEbitdaBloc,
    required this.summaryYearBloc,
    super.key,
    this.closeWhenSubmitted = false,
  });

  static Widget prepare({
    required FieldForceSummaryQueryBloc summaryBloc,
    required SummaryFieldForceReportEbitdaQueryBloc summaryEbitdaBloc,
    required SummaryFieldForceReportQueryBloc summaryYearBloc,
    required FieldForceSummaryQueryFilterBloc filterBloc,
    bool? closeWhenSubmitted,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MarketingAreaQueryBloc()
            ..add(const MarketingAreaQueryEvent.fetch()),
        ),
        BlocProvider(
          create: (context) => MarketingPositionQueryBloc()
            ..add(const MarketingPositionQueryEvent.fetch()),
        ),
      ],
      child: FilterForm(
        summaryBloc: summaryBloc,
        summaryEbitdaBloc: summaryEbitdaBloc,
        summaryYearBloc: summaryYearBloc,
        filterBloc: filterBloc,
        closeWhenSubmitted: closeWhenSubmitted,
      ),
    );
  }

  final FieldForceSummaryQueryBloc summaryBloc;
  final SummaryFieldForceReportEbitdaQueryBloc summaryEbitdaBloc;
  final SummaryFieldForceReportQueryBloc summaryYearBloc;
  final bool? closeWhenSubmitted;
  final FieldForceSummaryQueryFilterBloc filterBloc;

  @override
  State<FilterForm> createState() => _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  late DateTime _periodStart;
  late DateTime _periodEnd;

  final _periodStartController = TextEditingController();
  final _periodEndController = TextEditingController();
  final _positionController = TextEditingController();
  MarketingArea? _area;

  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.summaryBloc.add(
        FieldForceSummaryQueryEvent.fetch(
          periodEnd: _periodEnd,
          periodStart: _periodStart,
          areaCode: _area!.code,
          filter: FieldForceSummaryFilter(),
        ),
      );

      widget.summaryYearBloc.add(
        SummaryFieldForceReportQueryEvent.fetch(
          periodStart: int.parse(_periodStart.formatPeriod),
          periodEnd: int.parse(_periodEnd.formatPeriod),
          areaCode: _area!.code,
          jab: _positionController.text,
        ),
      );

      widget.summaryEbitdaBloc.add(
        SummaryFieldForceReportEbitdaQueryEvent.fetch(
          periodStart: int.parse(_periodStart.formatPeriod),
          periodEnd: int.parse(_periodEnd.formatPeriod),
          areaCode: _area!.code,
          jab: _positionController.text,
        ),
      );

      widget.filterBloc.add(
        FieldForceSummaryQueryFilterState(
          areaCode: _area!.code,
          periodEnd: _periodEnd,
          periodStart: _periodStart,
        ),
      );

      if (widget.closeWhenSubmitted!) {
        Navigator.pop(context);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    final now = DateTime.now();
    _periodStart = DateTime(now.year);
    _periodEnd = DateTime(now.year, now.month);

    final monthFormat = DateFormat.yMMMM();
    _periodStartController.text = monthFormat.format(_periodStart);
    _periodEndController.text = monthFormat.format(_periodEnd);
    _area = MarketingArea(code: 'BDGA1');
    _positionController.text = 'ASM';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TileDataVertical(
      label: 'Filter',
      strong: true,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FDropDownSearch(
              labelText: 'Position',
              items: const [
                'MD',
                'GSM',
                'FSM',
                'ASM',
                'SPV',
                'MR',
              ],
              initialValue: 'ASM',
              validator: requiredObjectValidator.call,
              onChanged: (value) {
                if (value != null) {
                  if (value == 'FSM') {
                    value = 'SM';
                  } else if (value == 'ASM') {
                    value = 'AM';
                  }
                  _positionController.text = value;
                  context
                      .read<MarketingAreaQueryBloc>()
                      .add(MarketingAreaQueryEvent.fetch(jab: value));
                }
              },
              itemAsString: (item) => item,
            ),
            const Gap(12),
            BlocBuilder<MarketingAreaQueryBloc, MarketingAreaQueryState>(
              builder: (context, state) {
                return FDropDownSearch<MarketingArea>(
                  initialValue: _area,
                  labelText: 'Area',
                  items: state.maybeWhen(
                    loaded: (marketingArea) => marketingArea,
                    orElse: () => [],
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      _area = value;
                    }
                  },
                  itemAsString: (area) => area.code,
                );
              },
            ),
            const Gap(12),
            FieldMonthPicker(
              initialSelectedDate: _periodStart,
              controller: _periodStartController,
              labelText: 'Start Period',
              maxDate: DateTime.now(),
              validator: requiredObjectValidator.call,
              onChanged: (value) => {
                _periodStart = value,
              },
            ),
            const Gap(12),
            FieldMonthPicker(
              initialSelectedDate: _periodEnd,
              controller: _periodEndController,
              labelText: 'End Period',
              maxDate: DateTime.now(),
              validator: requiredObjectValidator.call,
              onChanged: (value) => {
                _periodEnd = value,
              },
            ),
            const Gap(12),
            BlocBuilder<FieldForceSummaryQueryBloc,
                FieldForceSummaryQueryState>(
              bloc: widget.summaryBloc,
              builder: (context, state) {
                return Button(
                  permission: null,
                  color: colorScheme.secondary,
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
      ),
    );
  }
}
