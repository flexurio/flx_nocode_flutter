import 'package:appointment/src/app/bloc/value/bloc/value_bloc.dart';
import 'package:appointment/src/app/view/widget/data_table_set.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductStockDataTable extends StatefulWidget {
  const ProductStockDataTable({required this.productStockQueryBloc, super.key});

  final ProductStockQueryBloc productStockQueryBloc;

  @override
  State<ProductStockDataTable> createState() => _ProductStockDataTableState();
}

class _ProductStockDataTableState extends State<ProductStockDataTable> {
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: BlocBuilder<ProductStockQueryBloc, ProductStockQueryState>(
        bloc: widget.productStockQueryBloc,
        builder: (context, state) {
          return BlocBuilder<ValueBloc<ProductStockFilter>, ProductStockFilter>(
            builder: (context, filterState) {
              return DataTableSetJanganDipakaiLagi<ProductStock>(
                scrollController: _scrollController,
                isError:
                    state.maybeWhen(error: (_) => true, orElse: () => false),
                onRefresh: () => context.read<ProductStockQueryBloc>()
                  ..add(
                    ProductStockQueryEvent.fetch(
                      period: filterState.period,
                      productGroupId: filterState.productGroupId,
                      productId: filterState.productId,
                      batchId: filterState.batchId,
                    ),
                  ),
                key: ValueKey(state.hashCode),
                isProgress: state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                ),
                data: state.maybeWhen(
                  loaded: (productsStock) {
                    return productsStock;
                  },
                  orElse: () => [],
                ),
                title: 'Product Stock',
                search: (productStock) => [
                  productStock.product.name,
                ],
                actionRight: [
                  LightButtonSmallGroup(
                    action: DataAction.exportPdf,
                    children: {
                      PermissionProductStock.productStockWarehouseExportPdf: const ProductStockWarehouseExportPdfButton(),
                      PermissionProductStock.productDistributionExportPdf: const ProductDistributionExportPdfButton(),
                      PermissionProductStock.productStockMutationProductDetailExportPdf: const ProductStockMutationProductDetailExportPdfButton(),
                      PermissionProductStock.productStockMutationSummaryExportPdf: ProductStockMutationSummaryExportPdfButton(),
                      PermissionProductStock.productMutationSummaryExportPdf: ProductMutationSummaryExportPdfButton(),
                      PermissionProductStock.productStockPrint: ProductStockExportButton.prepare(),
                      PermissionProductStock.productStockWarehouseExportExcel: const ProductStockWarehouseExportExcelButton(),
                      PermissionProductStock.productStockCardBatchExportPdf: const ProductStockCardBatchExportPdfButton(),
                    },
                  ),
                ],
                columns: [
                  DTColumnX(
                    head: DTHeadX(
                      label: const Text('Period'),
                      sortString: (productStock) => productStock.period,
                    ),
                    body: (productStock) => DataCell(
                      Text(productStock.period),
                    ),
                  ),
                  DTColumnX(
                    head: DTHeadX(
                      label: const Text('Batch'),
                      sortString: (productStock) {
                        return productStock.batch.id;
                      },
                    ),
                    body: (productStock) => DataCell(
                      Text(productStock.batch.id),
                    ),
                  ),
                  DTColumnX(
                    head: DTHeadX(
                      label: const Text('Product Group'),
                      sortString: (productStock) =>
                          productStock.productGroup.id,
                    ),
                    body: (productStock) => DataCell(
                      Text(productStock.productGroup.id),
                    ),
                  ),
                  DTColumnX(
                    head: DTHeadX(
                      label: const Text('Product Name'),
                      sortString: (productStock) => productStock.product.name,
                    ),
                    body: (productStock) => DataCell(
                      Text(productStock.product.name),
                    ),
                  ),
                  DTColumnX(
                    head: DTHeadX(
                      label: const Text('Product ID'),
                      sortString: (productStock) => productStock.product.id,
                    ),
                    body: (productStock) => DataCell(
                      Text(productStock.product.id),
                    ),
                  ),
                  DTColumnX(
                    head: DTHeadX(
                      label: const Text('Beginning Balance'),
                      numeric: true,
                      sortNum: (productStock) => productStock.beginningBalance,
                    ),
                    body: (productStock) => DataCell(
                      Text(
                        productStock.beginningBalance.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  DTColumnX(
                    head: DTHeadX(
                      label: const Text('Quantity In'),
                      numeric: true,
                      sortNum: (productStock) => productStock.qtyIn,
                    ),
                    body: (productStock) => DataCell(
                      Text(
                        productStock.qtyIn.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  DTColumnX(
                    head: DTHeadX(
                      label: const Text('Quantity Out'),
                      numeric: true,
                      sortNum: (productStock) => productStock.qtyOut,
                    ),
                    body: (productStock) => DataCell(
                      Text(
                        productStock.qtyOut.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  DTColumnX(
                    head: DTHeadX(
                      label: const Text('Ending Balance'),
                      numeric: true,
                      sortNum: (productStock) => productStock.endingBalance,
                    ),
                    body: (productStock) => DataCell(
                      Text(
                        productStock.endingBalance.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  DTColumnX(
                    head: DTHeadX(
                      label: const Text('Quantity Out Marketing'),
                      numeric: true,
                      sortNum: (productStock) => productStock.qtyOutMarketing,
                    ),
                    body: (productStock) => DataCell(
                      Text(
                        productStock.qtyOutMarketing.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  DTColumnX(
                    head: DTHeadX(
                      label: const Text('Ending Balance Marketing'),
                      numeric: true,
                      sortNum: (productStock) =>
                          productStock.endingBalanceMarketing,
                    ),
                    body: (productStock) => DataCell(
                      Text(
                        productStock.endingBalanceMarketing.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

