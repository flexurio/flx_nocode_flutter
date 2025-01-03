import 'package:appointment/src/app/util/picker_file.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/recap_product_expenditure_query/recap_product_expenditure_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/permission.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/recap_product_expenditure.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecapProductExpenditureExportExcelButton extends StatefulWidget {
  const RecapProductExpenditureExportExcelButton({
    required this.dateStart,
    required this.dateEnd,
    required this.division,
    required this.warehouse,
    super.key,
  });

  static Widget prepare(
    DateTime dateStart,
    DateTime dateEnd,
    Division division,
    RecapProductExpenditureWarehouse warehouse,
  ) {
    return BlocProvider(
      create: (context) => RecapProductExpenditureQueryBloc(),
      child: RecapProductExpenditureExportExcelButton(
        dateStart: dateStart,
        dateEnd: dateEnd,
        division: division,
        warehouse: warehouse,
      ),
    );
  }

  final DateTime dateStart;
  final DateTime dateEnd;
  final Division division;
  final RecapProductExpenditureWarehouse warehouse;

  @override
  State<RecapProductExpenditureExportExcelButton> createState() =>
      _RecapProductExpenditureExportExcelButtonState();
}

class _RecapProductExpenditureExportExcelButtonState
    extends State<RecapProductExpenditureExportExcelButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RecapProductExpenditureQueryBloc>();

    return BlocListener<RecapProductExpenditureQueryBloc,
        RecapProductExpenditureQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) {
            final bytes = simpleExcel<RecapProductExpenditure>(
              context: context,
              data: pageOptions.data,
              columns: [
                TColumn(
                  title: 'product_id'.tr(),
                  builder: (data, index) =>
                      '${data.product.id} - ${data.product.name}',
                ),
                TColumn(
                  title: 'batch_no'.tr(),
                  builder: (data, index) => data.batchNoId,
                ),
                TColumn(
                  title: 'delivery_order_id'.tr(),
                  builder: (data, index) => data.productIssue.deliveryOrderId,
                ),
                TColumn(
                  title: 'expired_date'.tr(),
                  builder: (data, index) => data.expiredDate.ddMMyyyy,
                ),
                TColumn(
                  title: 'unit'.tr(),
                  builder: (data, index) => data.unit.id,
                ),
                TColumn(
                  title: 'qty_out'.tr(),
                  builder: (data, index) => data.qty.format(),
                ),
                TColumn(
                  title: 'total_qty_out_batch'.tr(),
                  numeric: true,
                  builder: (data, index) => pageOptions.data
                      .where((e) => e.batchNoId == data.batchNoId)
                      .fold<double>(0, (sum, e) => sum + e.qty)
                      .toString(),
                ),
                TColumn(
                  title: 'total_qty'.tr(),
                  numeric: true,
                  builder: (data, index) => pageOptions.data
                      .fold<double>(0, (sum, e) => sum + e.qty)
                      .toString(),
                ),
              ],
            );
            saveFile(bytes, 'Recap_Product_Expenditure.xlsx');
          },
        );
      },
      child: BlocBuilder<RecapProductExpenditureQueryBloc,
          RecapProductExpenditureQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportExcel,
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            permission:
                PermissionProductStock.recapProductExpenditureExportExcel,
            onPressed: () {
              bloc.add(
                RecapProductExpenditureQueryEvent.fetch(
                  dateStart: widget.dateStart,
                  dateEnd: widget.dateEnd,
                  division: widget.division,
                  warehouse: widget.warehouse,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
