import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_chiron_production/src/app/view/page/production_order/widget/export_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductionOrderDataTable extends StatefulWidget {
  const ProductionOrderDataTable._(this.isExternal);

  final bool isExternal;

  static Widget prepare({
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductionOrderQueryBloc(isExternal: isExternal)
            ..add(
              const ProductionOrderQueryEvent.fetch(
                isCancel: false,
              ),
            ),
        ),
      ],
      child: ProductionOrderDataTable._(isExternal),
    );
  }

  @override
  State<ProductionOrderDataTable> createState() =>
      _ProductionOrderDataTableState();
}

class _ProductionOrderDataTableState extends State<ProductionOrderDataTable> {
  var _month = DateTime.now();

  void _fetch() {
    context.read<ProductionOrderQueryBloc>().add(
          ProductionOrderQueryEvent.fetch(
            isCancel: false,
            periodStart: _month.startOfMonth,
            periodEnd: _month.endOfMonth,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    return BlocBuilder<ProductionOrderQueryBloc, ProductionOrderQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<ProductionOrder>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () => context.read<ProductionOrderQueryBloc>().add(
                  ProductionOrderQueryEvent.fetch(
                    isCancel: false,
                    periodStart: _month.startOfMonth,
                    periodEnd: _month.endOfMonth,
                  ),
                ),
            key: ValueKey(state.hashCode),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<ProductionOrderQueryBloc>().add(
                    ProductionOrderQueryEvent.fetch(
                      pageOptions: pageOptions,
                      isCancel: false,
                    ),
                  );
            },
            actionRight: (refreshButton) => [
              ProductionOrderReportJobsheetButton.prepare(
                isExternal: widget.isExternal,
              ),
              ProductionOrderExportPdfButton(isExternal: widget.isExternal),
              ProductionOrderBatchExportButton.prepare(
                isExternal: widget.isExternal,
              ),
              refreshButton,
              ProductionOrderCreateButton(isExternal: widget.isExternal),
            ],
            actionLeft: [
              _buildSelectPeriod(),
            ],
            columns: [
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  label: 'Batch',
                  backendColumn: 'production_orders.id',
                ),
                body: (productionOrder) => DataCell(
                  Text(productionOrder.id).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 10,
                head: const DTHead(
                  label: 'Product',
                  backendColumn: 'Product.name',
                ),
                body: (productionOrder) => DataCell(
                  Text(productionOrder.product.name),
                ),
              ),
              DTColumn(
                widthFlex: 10,
                head: const DTHead(
                  label: 'Status',
                  backendColumn: 'production_orders.product_status',
                ),
                body: (productionOrder) => DataCell(
                  ChipType(productionOrder.productStatus),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  label: 'Batch Size',
                  backendColumn: 'production_orders.batch_size',
                ),
                body: (productionOrder) => DataCell(
                  Text('${productionOrder.batchSize}'),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  label: 'NIE',
                  backendColumn: 'production_orders.nie',
                ),
                body: (productionOrder) => DataCell(
                  Text(productionOrder.nie ?? '-'),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  label: 'Expired Date',
                  backendColumn: 'production_orders.expiration_date',
                ),
                body: (productionOrder) => DataCell(
                  Text(productionOrder.expirationDate.yMMMd),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  label: 'Scale',
                  backendColumn: 'production_orders.scale',
                ),
                body: (productionOrder) => DataCell(
                  ChipType(productionOrder.scale),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  label: 'Ruahan',
                  backendColumn: 'production_orders.is_bulk',
                ),
                body: (productionOrder) {
                  return DataCell(
                    SizedBox(
                      child: BoolIcon(productionOrder.isRuahan),
                    ),
                  );
                },
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  label: 'Toll In',
                  backendColumn: 'production_orders.is_toll_in',
                ),
                body: (productionOrder) {
                  return DataCell(
                    SizedBox(
                      child: BoolIcon(productionOrder.isTollIn),
                    ),
                  );
                },
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  label: 'Rework',
                  backendColumn: 'production_orders.is_rework',
                ),
                body: (productionOrder) {
                  return DataCell(
                    SizedBox(
                      child: BoolIcon(productionOrder.isRework),
                    ),
                  );
                },
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  label: 'Cancel Rework',
                  backendColumn: 'production_orders.is_cancel',
                ),
                body: (productionOrder) {
                  return DataCell(
                    SizedBox(
                      child: BoolIcon(productionOrder.isCancel),
                    ),
                  );
                },
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  label: 'Confirm',
                  backendColumn: 'production_orders.is_confirm',
                ),
                body: (productionOrder) {
                  return DataCell(
                    SizedBox(
                      child: BoolIcon(productionOrder.isConfirm),
                    ),
                  );
                },
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (materialUnit) => DataCell(
                  Text(materialUnit.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  label: 'Updated At',
                  backendColumn: 'updated_at',
                ),
                body: (materialUnit) => DataCell(
                  Text(materialUnit.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 14,
                head: const DTHead(
                  label: 'Actions',
                  backendColumn: null,
                ),
                body: (productionOrder) => DataCell(
                  Row(
                    children: [
                      if (productionOrder.isRework ||
                          productionOrder.cancelReworkAt != null ||
                          productionOrder.isConfirm == false)
                        ProductionOrderConfirmButton.prepare(
                          productionOrder: productionOrder,
                          isExternal: widget.isExternal,
                        ),
                      if (!productionOrder.isRework &&
                          !productionOrder.isCancel)
                        ProductionOrderReworkButton.prepare(
                          productionOrder: productionOrder,
                          isExternal: widget.isExternal,
                        ),
                      if (productionOrder.isRework)
                        ProductionOrderCancelReworkButton.prepare(
                          productionOrder: productionOrder,
                          isExternal: widget.isExternal,
                        ),
                      if (productionOrder.isConfirm == false)
                        ProductionOrderDeleteButton.prepare(
                          productionOrder: productionOrder,
                          isExternal: widget.isExternal,
                        ),
                      if (productionOrder.isConfirm == false)
                        ProductionOrderUpdateButton(
                          productionOrder: productionOrder,
                          isExternal: widget.isExternal,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSelectPeriod() => DropDownSmallYearMonth(
        initialValue: _month,
        maxDate: DateTime.now(),
        labelText: 'period'.tr(),
        onChanged: (date) {
          _month = date;
          _fetch();
        },
      );
}
