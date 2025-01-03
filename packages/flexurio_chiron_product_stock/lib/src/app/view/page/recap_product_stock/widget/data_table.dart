import 'package:flexurio_chiron_product_stock/src/app/bloc/recap_product_stock_query/recap_product_stock_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/recap_product_stock.dart';
import 'package:appointment/src/app/view/widget/data_table_set.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecapProductStockDataTable extends StatefulWidget {
  const RecapProductStockDataTable({
    required this.recapProductStockQueryBloc,
    super.key,
  });

  final RecapProductStockQueryBloc recapProductStockQueryBloc;

  @override
  State<RecapProductStockDataTable> createState() =>
      _RecapProductStockDataTableState();
}

class _RecapProductStockDataTableState
    extends State<RecapProductStockDataTable> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child:
          BlocBuilder<RecapProductStockQueryBloc, RecapProductStockQueryState>(
        bloc: widget.recapProductStockQueryBloc,
        builder: (context, state) {
          return DataTableSetJanganDipakaiLagi<RecapProductStock>(
            key: ValueKey(state.hashCode),
            title: Entity.recapProductStock.title,
            search: (recapProductStock) => [
              recapProductStock.product.name,
              recapProductStock.productionOrder.id,
              recapProductStock.qtyQuarantine.toString(),
              recapProductStock.qtyReject.toString(),
              recapProductStock.qtyRelease.toString(),
            ],
            data: state.maybeWhen(
              orElse: () => [],
              loaded: (recapProductStocks) {
                return recapProductStocks;
              },
            ),
            isProgress: state.maybeWhen(
              orElse: () => false,
              loading: () => true,
            ),
            isError: state.maybeWhen(
              orElse: () => false,
              error: (_) => true,
            ),
            onRefresh: () => context
                .read<RecapProductStockQueryBloc>()
                .add(const RecapProductStockQueryEvent.fetch()),
            actionRight: const [],
            columns: [
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Period'),
                  sortString: (recapProductStock) =>
                      recapProductStock.period.yMMMM,
                ),
                body: (recapProductStock) => DataCell(
                  Text(recapProductStock.period.yMMMM),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Product Name'),
                  sortString: (recapProductStock) =>
                      recapProductStock.product.name,
                ),
                body: (recapProductStock) => DataCell(
                  Text(recapProductStock.product.name),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Batch'),
                  sortString: (recapProductStock) =>
                      recapProductStock.productionOrder.id,
                ),
                body: (recapProductStock) => DataCell(
                  Text(recapProductStock.productionOrder.id),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  numeric: true,
                  label: const Text('Quantity Quarantine'),
                  sortNum: (recapProductStock) =>
                      recapProductStock.qtyQuarantine,
                ),
                body: (recapProductStock) => DataCell(
                  Text(
                    recapProductStock.qtyQuarantine.toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    maxLines: 1,
                  ),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  numeric: true,
                  label: const Text('Quantity Reject'),
                  sortNum: (recapProductStock) => recapProductStock.qtyReject,
                ),
                body: (recapProductStock) => DataCell(
                  Text(
                    recapProductStock.qtyReject.toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                  ),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  numeric: true,
                  label: const Text('Quantity Release'),
                  sortNum: (recapProductStock) => recapProductStock.qtyRelease,
                ),
                body: (recapProductStock) => DataCell(
                  Text(
                    recapProductStock.qtyRelease.toString(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                  ),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Warehouse'),
                  sortString: (recapProductStock) =>
                      recapProductStock.warehouse.id,
                ),
                body: (recapProductStock) => DataCell(
                  ChipType(recapProductStock.warehouse),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Unit'),
                  sortString: (recapProductStock) => recapProductStock.unit.id,
                ),
                body: (recapProductStock) => DataCell(
                  Text(recapProductStock.unit.id),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: Text('created_at'.tr()),
                  sortNum: (recapProductStock) =>
                      recapProductStock.createdAt.millisecondsSinceEpoch,
                ),
                body: (recapProductStock) => DataCell(
                  Text(recapProductStock.createdAt.yMMMdHm),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Updated At'),
                  sortNum: (recapProductStock) =>
                      recapProductStock.updatedAt.millisecondsSinceEpoch,
                ),
                body: (recapProductStock) => DataCell(
                  Text(recapProductStock.updatedAt.yMMMdHm),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
