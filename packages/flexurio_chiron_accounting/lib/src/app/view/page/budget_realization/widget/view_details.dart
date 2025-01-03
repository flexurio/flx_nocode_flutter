import 'package:flexurio_chiron_accounting/src/app/model/budget_realization.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/budget_realization/util/budget_realization_details_excel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BudgetRealizationViewDetails extends StatelessWidget {
  const BudgetRealizationViewDetails({
    required this.budgetRealization,
    required this.viewBy,
    required this.type,
    super.key,
  });

  final BudgetRealization budgetRealization;
  final BudgetRealizationViewBy viewBy;
  final BudgetRealizationType type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final secondaryColor = theme.colorScheme.secondary;
    final assign = budgetRealization.assign(viewBy);
    return SingleFormPanel(
      action: DataAction.view,
      entity: Entity.budgetRealization,
      actions: [
        LightButton(
          action: DataAction.exportExcel,
          permission: Permission.budgetRealizationExportExcel,
          entity: Entity.budgetRealization,
          onPressed: () {
            final bytes = excelBudgetRealizationDetails(budgetRealization);
            saveFile(bytes, 'Budget_Realization_Details_$assign.xlsx');
          },
        ),
      ],
      children: [
        TileDataVertical(
          label: viewBy.label,
          child: Text(assign),
        ),
        SfCartesianChart(
          primaryXAxis: const CategoryAxis(),
          series: <CartesianSeries<ChartData, String>>[
            LineSeries<ChartData, String>(
              color: secondaryColor,
              dataSource:
                  List.generate(budgetRealization.months.length, (index) {
                return ChartData(
                  DateFormat('MMM').format(DateTime(0, index + 1)),
                  double.parse(
                    budgetRealization.months[index].replaceAll('%', ''),
                  ),
                );
              }),
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y ?? 0,
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                textStyle: TextStyle(color: theme.textTheme.bodyMedium!.color),
              ),
              markerSettings: const MarkerSettings(isVisible: true),
            ),
          ],
          primaryYAxis: const NumericAxis(labelFormat: '{value}%'),
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
