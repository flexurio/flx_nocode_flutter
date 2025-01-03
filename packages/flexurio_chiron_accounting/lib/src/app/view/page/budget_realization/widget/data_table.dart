import 'package:flexurio_chiron_accounting/src/app/bloc/budget_realization_query/budget_realization_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/budget_realization.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/budget_realization/widget/export_excel_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/budget_realization/widget/view_details.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/year.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BudgetRealizationDataTable extends StatefulWidget {
  const BudgetRealizationDataTable({super.key});

  @override
  State<BudgetRealizationDataTable> createState() =>
      _BudgetRealizationDataTableState();
}

class _BudgetRealizationDataTableState
    extends State<BudgetRealizationDataTable> {
  late int _year;
  var _viewBy = BudgetRealizationViewBy.generalManager;
  var _type = BudgetRealizationType.operationalCost;
  final backendColumnMonths = [
    'january',
    'february',
    'march',
    'april',
    'may',
    'june',
    'july',
    'august',
    'september',
    'october',
    'november',
    'december',
  ];

  @override
  void initState() {
    super.initState();
    _year = DateTime.now().year;

    _fetchData(context, PageOptions.emptyNoLimit());
  }

  void _fetchData(
    BuildContext context,
    PageOptions<BudgetRealization>? pageOptions,
  ) {
    context.read<BudgetRealizationQueryBloc>().add(
          BudgetRealizationQueryEvent.fetch(
            year: _year,
            viewBy: _viewBy,
            type: _type,
            pageOptions: pageOptions,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    // final queryBloc = context.read<BudgetRealizationQueryBloc>();
    return BlocBuilder<BudgetRealizationQueryBloc, BudgetRealizationQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<BudgetRealization>(
            pagination: false,
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () => _fetchData(context, null),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              _fetchData(context, pageOptions);
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionLeft: [
              _buildDropDownType(context),
              _buildDropDownYear(context),
              _buildDropDownViewBy(context),
            ],
            actionRight: (refreshButton) => [
              EmployeeCostExportExcelButton(viewBy: _viewBy),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 15,
                head: DTHead(
                  label: _viewBy.id.tr(),
                  backendColumn: 'department.name',
                ),
                body: (budgetRealization) {
                  return DataCell(
                    Text(
                      _viewBy == BudgetRealizationViewBy.generalManager
                          ? budgetRealization.generalManager
                          : budgetRealization.department.name,
                    ).clickable(
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              backgroundColor: Colors.transparent,
                              children: [
                                BudgetRealizationViewDetails(
                                  budgetRealization: budgetRealization,
                                  type: _type,
                                  viewBy: _viewBy,
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
              for (var i = 0; i < backendColumnMonths.length; i++)
                DTColumn(
                  widthFlex: 3,
                  head: DTHead(
                    numeric: true,
                    label: DateFormat('MMMM').format(DateTime(0, i + 1)),
                    backendColumn: backendColumnMonths[i],
                  ),
                  body: (budgetRealization) =>
                      DataCell(Text(budgetRealization.months[i])),
                ),
              DTColumn(
                widthFlex: 3,
                head: const DTHead(
                  numeric: true,
                  label: 'YTD',
                  backendColumn: 'year_to_date',
                ),
                body: (budgetRealization) =>
                    DataCell(Text(budgetRealization.yearToDate)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDropDownYear(BuildContext context) {
    return FDropDownSmallSearchYear(
      initialValue: _year,
      onChanged: (year) {
        if (year == null) return;
        _year = year;
        _fetchData(context, null);
      },
      minDate: DateTime(2023),
      maxDate: DateTime.now(),
    );
  }

  Widget _buildDropDownViewBy(BuildContext context) {
    return DropDownSmall<BudgetRealizationViewBy>(
      icon: Icons.recent_actors_rounded,
      initialValue: _viewBy,
      labelText: 'type'.tr(),
      itemAsString: (viewBy) => viewBy.label,
      items: BudgetRealizationViewBy.list,
      onChanged: (viewBy) {
        if (viewBy == null) return;
        _viewBy = viewBy;
        _fetchData(context, null);
      },
    );
  }

  Widget _buildDropDownType(BuildContext context) {
    return DropDownSmall<BudgetRealizationType>(
      icon: Icons.list,
      initialValue: _type,
      labelText: 'type'.tr(),
      itemAsString: (type) => type.label,
      items: BudgetRealizationType.list,
      onChanged: (type) {
        if (type == null) return;
        _type = type;
        _fetchData(context, null);
      },
    );
  }
}
