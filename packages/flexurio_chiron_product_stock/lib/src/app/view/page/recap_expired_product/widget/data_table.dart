import 'package:appointment/src/app/view/widget/drop_down_items/product.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/recap_expired_product_query/recap_expired_product_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/recap_expired_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/recap_product_expenditure.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/recap_expired_product/widget/export_excel_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecapExpiredProductDataTable extends StatefulWidget {
  const RecapExpiredProductDataTable({super.key});

  @override
  State<RecapExpiredProductDataTable> createState() =>
      _RecapExpiredProductDataTableState();
}

class _RecapExpiredProductDataTableState
    extends State<RecapExpiredProductDataTable> {
  late DateTime _dateExpired;
  Product? _product;
  var _division = Division.ethData;

  @override
  void initState() {
    super.initState();
    _dateExpired = DateTime.now();

    _fetch(context, PageOptions.emptyNoLimit());
  }

  void _fetch(
      BuildContext context, PageOptions<RecapExpiredProduct>? pageOptions) {
    context.read<RecapExpiredProductQueryBloc>().add(
          RecapExpiredProductQueryEvent.fetch(
            dateExpired: _dateExpired,
            division: _division,
            product: _product,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<RecapExpiredProductQueryBloc>();
    return BlocBuilder<RecapExpiredProductQueryBloc,
        RecapExpiredProductQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<RecapExpiredProduct>(
            onRefresh: () => queryBloc.add(
              RecapExpiredProductQueryEvent.fetch(
                dateExpired: _dateExpired,
                product: _product,
                division: _division,
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
              _buildDropDownDivision(context),
              _buildDropDownProduct(),
            ],
            actionRight: (refreshButton) => [
              RecapExpiredProductExportExcelButton.prepare(
                  _dateExpired, _product, _division),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  label: 'product_id'.tr(),
                  backendColumn: 'product_id',
                ),
                body: (recapExpiredProduct) => DataCell(
                  Text(recapExpiredProduct.product.id),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'product_name'.tr(),
                  backendColumn: 'product_name',
                ),
                body: (recapExpiredProduct) => DataCell(
                  Text(recapExpiredProduct.product.name),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  label: 'batch_no'.tr(),
                  backendColumn: 'batch_no_id',
                ),
                body: (recapExpiredProduct) => DataCell(
                  Text(recapExpiredProduct.batchNoId),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  numeric: true,
                  label: 'ending_balance'.tr(),
                  backendColumn: 'ending_balance',
                ),
                body: (recapExpiredProduct) => DataCell(
                  Text(recapExpiredProduct.endingBalance.format()),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  label: 'expired_date'.tr(),
                  backendColumn: 'expired_date',
                ),
                body: (recapExpiredProduct) => DataCell(
                  Text(recapExpiredProduct.expiredDate.ddMMyyyy),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: DTHead(
                  numeric: true,
                  label: 'month'.tr(),
                  backendColumn: 'expired_date',
                ),
                body: (recapExpiredProduct) {
                  final now = DateTime.now();
                  final diff =
                      recapExpiredProduct.expiredDate.difference(now).inDays;
                  final month = (diff / 30).ceil();
                  return DataCell(
                    Text(month.toString()),
                  );
                },
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

  Widget _buildDropDownProduct() {
    return FDropDownSearchSmallProduct(
      width: 200,
      initialValue: _product,
      iconField: Icons.medical_information,
      onChanged: (product) {
        if (product == null) return;
        _product = product;
        _fetch(context, null);
      },
    );
  }
}
