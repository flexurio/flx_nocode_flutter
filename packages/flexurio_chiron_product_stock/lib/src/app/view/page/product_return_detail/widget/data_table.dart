import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_detail_query/product_return_detail_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_query/product_return_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_detail.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_detail/widget/view_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnDetailDataTable extends StatefulWidget {
  const ProductReturnDetailDataTable({
    required this.productReturn,
    required this.productReturnDetailQueryBloc,
    super.key,
  });

  final ProductReturn productReturn;
  final ProductReturnDetailQueryBloc productReturnDetailQueryBloc;

  static Widget prepare({
    required ProductReturn productReturn,
    required ProductReturnDetailQueryBloc productReturnDetailQueryBloc,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => productReturnDetailQueryBloc,
        ),
      ],
      child: ProductReturnDetailDataTable(
        productReturn: productReturn,
        productReturnDetailQueryBloc: productReturnDetailQueryBloc,
      ),
    );
  }

  @override
  State<ProductReturnDetailDataTable> createState() =>
      _ProductReturnDetailDataTableState();
}

class _ProductReturnDetailDataTableState
    extends State<ProductReturnDetailDataTable> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductReturnDetailQueryBloc,
        ProductReturnDetailQueryState>(
      bloc: widget.productReturnDetailQueryBloc,
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<ProductReturnDetail>(
            freezeFirstColumn: true,
            key: ValueKey(state.hashCode),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            onChanged: (pageOptions) {
              widget.productReturnDetailQueryBloc.add(
                    ProductReturnDetailQueryEvent.fetch(
                        pageOptions: pageOptions,
                        productReturnId: widget.productReturn.id),
                  );
            },
            onRefresh: () => widget.productReturnDetailQueryBloc.add(
                ProductReturnDetailQueryEvent.fetch(
                    productReturnId: widget.productReturn.id)),
            status: state.maybeWhen(
              orElse: () => Status.error,
              loading: (_) => Status.progress,
              loaded: (productReturnDetail) => Status.loaded,
            ),
            actionRight: (refreshButton) => [
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'delivery_order'.tr(),
                  backendColumn: 'delivery_order_id',
                ),
                body: (detail) => DataCell(
                  Text(detail.deliveryOrderId).canCopy(
                    onTap: () {
                      Navigator.push(
                        context,
                        ProductReturnDetailViewPage.route(
                          detail,
                        ),
                      ).then((_) {
                        widget.productReturnDetailQueryBloc.add(
                              ProductReturnDetailQueryEvent.fetch(
                                  productReturnId: widget.productReturn.id),
                            );
                      });
                    },
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'product_return_id'.tr(),
                  backendColumn: 'product_return_id.id',
                ),
                body: (detail) => DataCell(Text(detail.productReturn.id)),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'product'.tr(),
                  backendColumn: 'product_id.name',
                ),
                body: (detail) => DataCell(Text(detail.product.name)),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'batch_no'.tr(),
                  backendColumn: 'batch_no.id',
                ),
                body: (detail) => DataCell(Text(detail.batchNo.id)),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'quantity'.tr(),
                  backendColumn: 'quantity',
                ),
                body: (detail) => DataCell(Text(detail.quantity.toString())),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'quantity_check'.tr(),
                  backendColumn: 'quantity_check',
                ),
                body: (detail) =>
                    DataCell(Text(detail.quantityCheck.toString())),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'unit'.tr(),
                  backendColumn: 'unit.id',
                ),
                body: (detail) => DataCell(Text(detail.unit.id)),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'price'.tr(),
                  backendColumn: 'product_price',
                ),
                body: (detail) => DataCell(
                  Text(
                    detail.productPrice == 0
                        ? '0'
                        : detail.productPrice.format(),
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'total'.tr(),
                  backendColumn: 'total_product_price',
                ),
                body: (detail) => DataCell(
                  Text(
                    detail.totalProductPrice == 0
                        ? '0'
                        : detail.totalProductPrice.format(),
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (detail) => DataCell(
                  Text(detail.createAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'updated_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (detail) => DataCell(
                  Text(detail.updatedAt.yMMMdHm),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
