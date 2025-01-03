import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_query/material_request_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flutter/material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveStatusesDonutChart extends StatelessWidget {
  const ActiveStatusesDonutChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseRequestQueryBloc, PurchaseRequestQueryState>(
      builder: (context, state) {
        final materialRequests = state.maybeWhen(
          loaded: (materialRequest) => materialRequest.data,
          orElse: () => <MaterialRequest>[],
        );

        var inputCount = 0.0;
        var inProgressCount = 0.0;
        for (final materialRequest in materialRequests) {
          if (materialRequest.status.isInput) inputCount++;
          if (materialRequest.status.isInProgress) {
            inProgressCount++;
          }
        }

        return DonutChart(
          title: 'Active Statuses',
          dataSource: [
            ChartData(
              label: PurchaseRequestStatus.input.label,
              value: inputCount,
              color: PurchaseRequestStatus.input.color,
            ),
            ChartData(
              label: PurchaseRequestStatus.inProgress.label,
              value: inProgressCount,
              color: PurchaseRequestStatus.inProgress.color,
            ),
          ],
        );
      },
    );
  }
}
