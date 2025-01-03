import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/recap_product_expenditure_query/recap_product_expenditure_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/recap_product_expenditure.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/recap_product_expenditure/widget/export_excel_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecapProductExpenditureDataTable extends StatefulWidget {
  const RecapProductExpenditureDataTable({super.key});

  @override
  State<RecapProductExpenditureDataTable> createState() =>
      _RecapProductExpenditureDataTableState();
}

class _RecapProductExpenditureDataTableState
    extends State<RecapProductExpenditureDataTable> {
  late DateTime _dateStart;
  late DateTime _dateEnd;
  var _division = Division.ethData;
  var _warehouse = RecapProductExpenditureWarehouse.productJadiData;

  @override
  void initState() {
    super.initState();
    _dateStart = DateTime.now().startOfMonth;
    _dateEnd = DateTime.now().endOfMonth;

    _fetch(context, PageOptions.emptyNoLimit());
  }

  void _fetch(
      BuildContext context, PageOptions<RecapProductExpenditure>? pageOptions) {
    context.read<RecapProductExpenditureQueryBloc>().add(
          RecapProductExpenditureQueryEvent.fetch(
            dateStart: _dateStart,
            dateEnd: _dateEnd,
            division: _division,
            warehouse: _warehouse,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<RecapProductExpenditureQueryBloc>();
    return BlocBuilder<RecapProductExpenditureQueryBloc,
        RecapProductExpenditureQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<RecapProductExpenditure>(
            onRefresh: () => queryBloc.add(
              RecapProductExpenditureQueryEvent.fetch(
                dateEnd: _dateEnd,
                dateStart: _dateStart,
                division: _division,
                warehouse: _warehouse,
              ),
            ),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              _fetch(context, PageOptions.emptyNoLimit());
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionLeft: [
              DropDownSmallDate(
                initialValue: _dateStart,
                labelText: 'start_date'.tr(),
                onChanged: (date) {
                  _dateStart = date;
                  _fetch(context, PageOptions.emptyNoLimit());
                },
              ),
              DropDownSmallDate(
                initialValue: _dateEnd,
                labelText: 'end_date'.tr(),
                onChanged: (date) {
                  _dateEnd = date;
                  _fetch(context, PageOptions.emptyNoLimit());
                },
              ),
              _buildDropDownDivision(context),
              _buildDropDownWarehouse(context),
            ],
            actionRight: (refreshButton) => [
              RecapProductExpenditureExportExcelButton.prepare(
                  _dateStart, _dateEnd, _division, _warehouse),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 2,
                head: DTHead(
                  label: 'product_id'.tr(),
                  backendColumn: 'product_id',
                ),
                body: (recapProductExpenditure) => DataCell(
                  Text(recapProductExpenditure.product.id),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'batch_no'.tr(),
                  backendColumn: 'batch_no',
                ),
                body: (recapProductExpenditure) => DataCell(
                  Text(recapProductExpenditure.batchNoId),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  label: 'delivery_order_id'.tr(),
                  backendColumn: 'delivery_order_id',
                ),
                body: (recapProductExpenditure) => DataCell(
                  Text(recapProductExpenditure.productIssue.deliveryOrderId),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  label: 'expired_date'.tr(),
                  backendColumn: 'expired_date',
                ),
                body: (recapProductExpenditure) => DataCell(
                  Text(recapProductExpenditure.expiredDate.ddMMyyyy),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  label: 'unit'.tr(),
                  backendColumn: 'unit',
                ),
                body: (recapProductExpenditure) => DataCell(
                  Text(recapProductExpenditure.unit.id),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  numeric: true,
                  label: 'qty'.tr(),
                  backendColumn: 'qty',
                ),
                body: (recapProductExpenditure) => DataCell(
                  Text(recapProductExpenditure.qty.format()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDropDownDivision(BuildContext context) {
    return DropDownSmall<Division>(
      icon: Icons.list,
      initialValue: _division,
      labelText: 'division'.tr(),
      itemAsString: (type) => type.label,
      items: Division.list,
      onChanged: (type) {
        if (type == null) return;
        _division = type;
        _fetch(context, null);
      },
    );
  }

  Widget _buildDropDownWarehouse(BuildContext context) {
    return DropDownSmall<RecapProductExpenditureWarehouse>(
      icon: Icons.list,
      initialValue: _warehouse,
      labelText: 'division'.tr(),
      itemAsString: (type) => type.label,
      items: RecapProductExpenditureWarehouse.list,
      onChanged: (type) {
        if (type == null) return;
        _warehouse = type;
        _fetch(context, null);
      },
    );
  }
}
