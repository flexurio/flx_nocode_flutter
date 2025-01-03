import 'package:flexurio_chiron_marketing/src/app/bloc/field_force_summary_detail_query/field_force_summary_detail_query_bloc.dart';
import 'package:flexurio_chiron_marketing/src/app/bloc/field_force_summary_query/field_force_summary_query_bloc.dart';
import 'package:flexurio_chiron_marketing/src/app/model/field_force_summary.dart';
import 'package:flexurio_chiron_marketing/src/app/view/page/marketing_field_force_summary/widget/dimension_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_identifier/screen_identifier.dart';

class SummaryTablesPerMonth extends StatefulWidget {
  const SummaryTablesPerMonth({
    required this.bloc,
    required this.areaCode,
    required this.periodStart,
    required this.periodEnd,
    required this.category,
    required this.onSelectedRow,
    super.key,
  });

  final String areaCode;
  final DateTime periodStart;
  final DateTime periodEnd;
  final FieldForceSummaryCategory category;
  final void Function(
    FieldForceSummary summary,
    FieldForceSummaryFlag flag,
  ) onSelectedRow;

  final FieldForceSummaryDetailQueryBloc bloc;

  @override
  State<SummaryTablesPerMonth> createState() => _SummaryTablesPerMonthState();
}

class _SummaryTablesPerMonthState extends State<SummaryTablesPerMonth> {
  final _summaryBloc = FieldForceSummaryQueryBloc();
  var _flagView = FieldForceSummaryFlag.outlet;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FieldForceSummaryDetailQueryBloc,
        FieldForceSummaryDetailQueryState>(
      bloc: widget.bloc,
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (product, outlet, customer, period) {
            return FCard(
              padding: const EdgeInsets.all(24),
              child: ScreenIdentifierBuilder(
                builder: (context, screenIdentifier) {
                  return screenIdentifier.conditions(
                    lg: _buildTable3Columns(product, outlet, customer),
                    sm: _buildTable3Rows(product, outlet, customer),
                  );
                },
              ),
            );
          },
          loading: () {
            return const CupertinoActivityIndicator();
          },
          orElse: () {
            return const SomethingWrong();
          },
        );
      },
    );
  }

  Column _buildTable3Rows(
    List<FieldForceSummaryWithDelta>? products,
    List<FieldForceSummaryWithDelta>? outlets,
    List<FieldForceSummaryWithDelta>? customers,
  ) {
    return Column(
      children: [
        if (outlets != null)
          Visibility(
            visible: _flagView == FieldForceSummaryFlag.outlet,
            child: DimensionTable.prepare(
              label: (data) => data.outlet,
              onSelectedRow: widget.onSelectedRow,
              areaCode: widget.areaCode,
              periodEnd: widget.periodEnd,
              periodStart: widget.periodStart,
              summaryBloc: _summaryBloc,
              flag: FieldForceSummaryFlag.outlet,
              data: outlets,
              onFlagChanged: (value) {
                setState(() => _flagView = value);
              },
            ),
          ),
        if (customers != null)
          Visibility(
            visible: _flagView == FieldForceSummaryFlag.customer,
            child: DimensionTable.prepare(
              label: (data) => data.customer,
              onSelectedRow: widget.onSelectedRow,
              areaCode: widget.areaCode,
              periodEnd: widget.periodEnd,
              periodStart: widget.periodStart,
              summaryBloc: _summaryBloc,
              flag: FieldForceSummaryFlag.customer,
              data: customers,
              onFlagChanged: (value) {
                setState(() => _flagView = value);
              },
            ),
          ),
        if (products != null)
          Visibility(
            visible: _flagView == FieldForceSummaryFlag.product,
            child: DimensionTable.prepare(
              label: (data) => data.product,
              onSelectedRow: widget.onSelectedRow,
              areaCode: widget.areaCode,
              periodEnd: widget.periodEnd,
              periodStart: widget.periodStart,
              summaryBloc: _summaryBloc,
              flag: FieldForceSummaryFlag.product,
              data: products,
              onFlagChanged: (value) {
                setState(() => _flagView = value);
              },
            ),
          ),
      ],
    );
  }

  Widget _buildTable3Columns(
    List<FieldForceSummaryWithDelta>? products,
    List<FieldForceSummaryWithDelta>? outlets,
    List<FieldForceSummaryWithDelta>? customers,
  ) {
    return RowFields(
      children: [
        if (outlets != null)
          Expanded(
            child: DimensionTable.prepare(
              label: (data) => data.outlet,
              onSelectedRow: widget.onSelectedRow,
              areaCode: widget.areaCode,
              periodEnd: widget.periodEnd,
              periodStart: widget.periodStart,
              summaryBloc: _summaryBloc,
              flag: FieldForceSummaryFlag.outlet,
              data: outlets,
              onFlagChanged: null,
            ),
          ),
        if (customers != null)
          Expanded(
            child: DimensionTable.prepare(
              label: (data) => data.customer,
              onSelectedRow: widget.onSelectedRow,
              areaCode: widget.areaCode,
              periodEnd: widget.periodEnd,
              periodStart: widget.periodStart,
              summaryBloc: _summaryBloc,
              flag: FieldForceSummaryFlag.customer,
              data: customers,
              onFlagChanged: null,
            ),
          ),
        if (products != null)
          Expanded(
            child: DimensionTable.prepare(
              label: (data) => data.product,
              onSelectedRow: widget.onSelectedRow,
              areaCode: widget.areaCode,
              periodEnd: widget.periodEnd,
              periodStart: widget.periodStart,
              summaryBloc: _summaryBloc,
              flag: FieldForceSummaryFlag.product,
              data: products,
              onFlagChanged: null,
            ),
          ),
      ],
    );
  }
}
