import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_check_query/product_return_check_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_check.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_detail.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_check/widget/create_button.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_check/widget/view_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnCheckDataTable extends StatefulWidget {
  const ProductReturnCheckDataTable({
    required this.productReturn,
    required this.productReturnDetail,
    required this.productReturnDetailQueryBloc,
    super.key,
  });

  final ProductReturn productReturn;
  final ProductReturnDetail productReturnDetail;
  final ProductReturnDetailQueryBloc productReturnDetailQueryBloc;

  static Widget prepare({
    required ProductReturn productReturn,
    required ProductReturnDetail productReturnDetail,
    required ProductReturnDetailQueryBloc productReturnDetailQueryBloc,
  }) {
    return BlocProvider(
      create: (context) => ProductReturnCheckQueryBloc()
        ..add(ProductReturnCheckQueryEvent.fetch(
          productReturnId: productReturn.id,
          productId: productReturnDetail.product.id,
          batchId: productReturnDetail.batchNo.id,
        )),
      child: ProductReturnCheckDataTable(
        productReturn: productReturn,
        productReturnDetail: productReturnDetail,
        productReturnDetailQueryBloc: productReturnDetailQueryBloc,
      ),
    );
  }

  @override
  State<ProductReturnCheckDataTable> createState() =>
      _ProductReturnCheckDataTableState();
}

class _ProductReturnCheckDataTableState
    extends State<ProductReturnCheckDataTable> {
  @override
  Widget build(BuildContext context) {
    bool isCreate = false;
    final productReturnDetailQty = widget.productReturnDetail.quantity;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<ProductReturnCheckQueryBloc,
          ProductReturnCheckQueryState>(
        builder: (context, state) {
          isCreate = state.maybeWhen(
            orElse: () => false,
            loading: (_) => false,
            loaded: (productReturnCheck) {
              if (productReturnCheck.data.isEmpty) {
                return true;
              } else {
                final qtyCheck = productReturnCheck.data
                    .map((e) => e.quantity)
                    .reduce((a, b) => a + b);
                if (qtyCheck >= productReturnDetailQty) {
                  return false;
                } else {
                  return true;
                }
              }
            },
          );
          return DataTableBackend<ProductReturnCheck>(
            freezeFirstColumn: true,
            key: ValueKey(state.hashCode),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            status: state.maybeWhen(
              orElse: () => Status.error,
              loading: (_) => Status.progress,
              loaded: (productReturn) => Status.loaded,
            ),
            onChanged: (pageOptions) {
              context.read<ProductReturnCheckQueryBloc>().add(
                    ProductReturnCheckQueryEvent.fetch(
                      productReturnId: widget.productReturn.id,
                      productId: widget.productReturnDetail.product.id,
                      batchId: widget.productReturnDetail.batchNo.id,
                      pageOptions: pageOptions,
                    ),
                  );
            },
            actionRight: (refreshButton) => [
              refreshButton,
              if (isCreate == true)
                ProductReturnCheckCreateButton(
                  productReturnDetail: widget.productReturnDetail,
                  productReturn: widget.productReturn,
                  productReturnDetailQueryBloc:
                      widget.productReturnDetailQueryBloc,
                ),
            ],
            onRefresh: () => context.read<ProductReturnCheckQueryBloc>().add(
                ProductReturnCheckQueryEvent.fetch(
                    productReturnId: widget.productReturn.id,
                    productId: widget.productReturnDetail.product.id,
                    batchId: widget.productReturnDetail.batchNo.id)),
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'product_return_id'.tr(),
                  backendColumn: 'product_return_id.id',
                ),
                body: (productReturnCheck) => DataCell(
                  Text(productReturnCheck.productReturnId.id).canCopy(
                    onTap: () {
                      Navigator.push(
                        context,
                        ProductReturnCheckViewPage.route(
                          productReturnDetail: widget.productReturnDetail,
                          productReturnDetailQueryBloc: widget.productReturnDetailQueryBloc,
                          productReturnCheck: productReturnCheck,
                        ),
                      ).then((_) {
                        context.read<ProductReturnCheckQueryBloc>().add(
                              ProductReturnCheckQueryEvent.fetch(
                                  productReturnId: widget.productReturn.id,
                                  productId:
                                      widget.productReturnDetail.product.id,
                                  batchId:
                                      widget.productReturnDetail.batchNo.id),
                            );
                      });
                    },
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'reference_no'.tr(),
                  backendColumn: 'product_return_id.reference_no',
                ),
                body: (productReturnCheck) =>
                    DataCell(Text(productReturnCheck.productReturnId.referenceNo)),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'status'.tr(),
                  backendColumn: null,
                ),
                body: (detail) =>
                    DataCell(ChipType(widget.productReturn.status)),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'check_status_qa'.tr(),
                  backendColumn: null,
                ),
                body: (detail) => DataCell(ChipType(detail.status)),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'product'.tr(),
                  backendColumn: 'product_id.id',
                ),
                body: (productReturnCheck) =>
                    DataCell(Text(productReturnCheck.productId.id)),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'product_name'.tr(),
                  backendColumn: 'product_id.name',
                ),
                body: (detail) => DataCell(Text(detail.productId.name)),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'batch_no'.tr(),
                  backendColumn: 'batch.id',
                ),
                body: (detail) => DataCell(Text(detail.batch.id)),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  numeric: true,
                  label: 'quantity'.tr(),
                  backendColumn: 'quantity',
                ),
                body: (detail) => DataCell(Text(detail.quantity.toString())),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'unit'.tr(),
                  backendColumn: 'unit_id.id',
                ),
                body: (detail) => DataCell(Text(detail.unitId.id)),
              ),
              DTColumn(
                widthFlex: 10,
                head: DTHead(
                  numeric: true,
                  label: 'quality_assurance_checked_at'.tr(),
                  backendColumn: 'quality_assurance_check_date',
                ),
                body: (detail) =>
                    DataCell(Text(detail.qualityCheckDate.yMMMdHm)),
              ),
            ],
          );
        },
      ),
    );
  }
}
