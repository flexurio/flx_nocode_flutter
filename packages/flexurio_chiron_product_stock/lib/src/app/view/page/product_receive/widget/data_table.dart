import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive_detail_query/product_receive_detail_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_receive_detail.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive/widget/create_button.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive/widget/export_excel_button.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive/widget/export_pdf_button.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive/widget/product_receive_recap_export_button.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive/widget/reject_button.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive/widget/release_button.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive/widget/view_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReceiveDataTable extends StatefulWidget {
  const ProductReceiveDataTable({
    required this.queryBloc,
    super.key,
    required this.isExternal,
  });
  final bool isExternal;

  final ProductReceiveDetailQueryBloc queryBloc;

  @override
  State<ProductReceiveDataTable> createState() =>
      _ProductReceiveDataTableState();
}

class _ProductReceiveDataTableState extends State<ProductReceiveDataTable> {
  String _statusSelected = 'KARANTINA';

  @override
  void initState() {
    super.initState();
    _statusSelected = 'KARANTINA';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductReceiveDetailQueryBloc,
        ProductReceiveDetailQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<ProductReceiveDetail>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () => context.read<ProductReceiveDetailQueryBloc>().add(
                  ProductReceiveDetailQueryEvent.fetch(
                    status: _statusSelected,
                  ),
                ),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              const ProductReceiveRecapExportButton(),
              ProductReceiveExportExcelButton.prepare(
                isExternal: widget.isExternal,
              ),
              refreshButton,
              ProductReceiveCreateButton(
                statusSelected: _statusSelected,
                isExternal: widget.isExternal,
              ),
            ],
            actionLeft: [
              DropDownSmall<String>(
                initialValue: _statusSelected,
                labelText: 'Status',
                itemAsString: (status) => status,
                // todo(putra): use enum
                items: const ['KARANTINA', 'RELEASE', 'REJECT'],
                onChanged: (selected) {
                  if (selected != null) {
                    _statusSelected = selected;
                    context.read<ProductReceiveDetailQueryBloc>().add(
                          ProductReceiveDetailQueryEvent.fetch(
                            status: _statusSelected,
                          ),
                        );
                  }
                },
              ),
            ],
            columns: [
              DTColumn(
                widthFlex: 8,
                head: const DTHead(label: 'ID', backendColumn: 'id'),
                body: (productReceiveDetail) => DataCell(
                  Text(productReceiveDetail.productReceive.id).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'product'.tr(),
                  backendColumn: 'Product.name',
                ),
                body: (productReceiveDetail) => DataCell(
                  Text(productReceiveDetail.product.name),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'product_order_id'.tr(),
                  backendColumn: 'batch_no.id',
                ),
                body: (productReceiveDetail) => DataCell(
                  Text(productReceiveDetail.productionOrder.id),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'type'.tr(),
                  backendColumn: 'product_received',
                ),
                body: (productReceiveDetail) => DataCell(
                  ChipType(productReceiveDetail.productReceive.type),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(label: 'Status', backendColumn: 'status'),
                body: (productReceiveDetail) => DataCell(
                  ChipType(productReceiveDetail.status),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: const DTHead(
                  label: 'Supplier',
                  backendColumn: 'Supplier.name',
                ),
                body: (productReceiveDetail) => DataCell(
                  Text(
                    '${productReceiveDetail.productReceive.supplier.id} - ${productReceiveDetail.productReceive.supplier.name}',
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: const DTHead(
                  label: 'Delivery Order ID',
                  backendColumn: 'delivery_order_id',
                ),
                body: (productReceiveDetail) => DataCell(
                  Text(
                    productReceiveDetail.productReceive.deliveryOrderId ?? '',
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'delivery_order_date'.tr(),
                  backendColumn: 'delivery_order_date',
                ),
                body: (productReceiveDetail) => DataCell(
                  Text(
                    productReceiveDetail
                            .productReceive.deliveryOrderDate?.yMMMMd ??
                        '',
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'expired_date'.tr(),
                  backendColumn: 'expired_date',
                ),
                body: (productReceiveDetail) => DataCell(
                  Text(
                    productReceiveDetail.expiredDate.yMMMMd,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: const DTHead(
                  label: 'Purchase Order ID',
                  backendColumn: 'PurchaseOrder.id',
                ),
                body: (productReceiveDetail) => DataCell(
                  Text(productReceiveDetail.productReceive.purchaseOrder.id),
                ),
              ),
              DTColumn(
                widthFlex: 2,
                head: DTHead(
                  numeric: true,
                  label: 'quantity'.tr(),
                  backendColumn: 'qty',
                ),
                body: (productReceiveDetail) => DataCell(
                  Text(productReceiveDetail.quantity.toString()),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: const DTHead(label: 'Unit', backendColumn: 'Unit.id'),
                body: (productReceiveDetail) => DataCell(
                  Text(productReceiveDetail.unit.id),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (productReceiveDetail) => DataCell(
                  Text(productReceiveDetail.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'updated_at'.tr(),
                  backendColumn: 'updated_at',
                ),
                body: (productReceiveDetail) => DataCell(
                  Text(productReceiveDetail.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 12.4,
                head: DTHead(label: 'actions'.tr(), backendColumn: null),
                body: (productReceiveDetail) {
                  return DataCell(
                    Row(
                      children: [
                        ProductReceiveViewButton(
                          productReceiveDetail: productReceiveDetail,
                          isExternal: widget.isExternal,
                        ),
                        ExportPdfButton.prepare(
                          productReceiveDetail: productReceiveDetail,
                          isExternal: widget.isExternal,
                        ),
                        if (productReceiveDetail.status ==
                            ProductReceiveDetailStatus.quarantine)
                          ProductReceiveReleaseButton.prepare(
                            productReceiveDetail: productReceiveDetail,
                            statusSelected: _statusSelected,
                            isExternal: widget.isExternal,
                          ),
                        if (productReceiveDetail.status ==
                            ProductReceiveDetailStatus.quarantine)
                          ProductReceiveRejectButton.prepare(
                            productReceiveDetail: productReceiveDetail,
                            isExternal: widget.isExternal,
                          ),
                      ],
                    ),
                  );
                },
              ),
            ],
            onChanged: (pageOptions) {
              context.read<ProductReceiveDetailQueryBloc>().add(
                    ProductReceiveDetailQueryEvent.fetch(
                      pageOptions: pageOptions,
                      status: _statusSelected,
                    ),
                  );
            },
          ),
        );
      },
    );
  }
}
