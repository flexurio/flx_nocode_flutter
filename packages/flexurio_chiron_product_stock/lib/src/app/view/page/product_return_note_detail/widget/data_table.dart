import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_note_detail_query/product_return_note_detail_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_note.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_note_detail.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_note_detail/widget/create_button.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_note_detail/widget/delete_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnNoteDetailDataTable extends StatelessWidget {
  const ProductReturnNoteDetailDataTable({
    required this.productReturnNote,
    super.key,
  });

  final ProductReturnNote productReturnNote;

  static Widget prepare({
    required ProductReturnNote productReturnNote,
  }) {
    return BlocProvider(
      create: (context) => ProductReturnNoteDetailQueryBloc()
        ..add(
          ProductReturnNoteDetailQueryEvent.fetch(
            productReturnNoteId: productReturnNote.id,
          ),
        ),
      child: ProductReturnNoteDetailDataTable(
        productReturnNote: productReturnNote,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductReturnNoteDetailQueryBloc,
        ProductReturnNoteDetailQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<ProductReturnNoteDetail>(
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            onChanged: (pageOptions) {
              context
                  .read<ProductReturnNoteDetailQueryBloc>()
                  .add(ProductReturnNoteDetailQueryEvent.fetch(
                    pageOptions: pageOptions,
                    productReturnNoteId: productReturnNote.id,
                  ));
            },
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            actionRight: (refreshButton) => [
              refreshButton,
              if (productReturnNote.approvedAt == null &&
                  productReturnNote.approvedById == 0)
                ProductReturnNoteDetailCreateButton(
                  productReturnNote: productReturnNote,
                ),
            ],
            onRefresh: () =>
                context.read<ProductReturnNoteDetailQueryBloc>().add(
                      ProductReturnNoteDetailQueryEvent.fetch(
                        productReturnNoteId: productReturnNote.id,
                      ),
                    ),
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'return_number'.tr(),
                  backendColumn: 'product_return_note_id',
                ),
                body: (productReturnNoteDetail) => DataCell(
                  Text(productReturnNoteDetail.productReturnNote.id),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'product_return'.tr(),
                  backendColumn: 'product_return_id',
                ),
                body: (productReturnNoteDetail) => DataCell(
                  Text(productReturnNoteDetail.productReturn.id),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'product'.tr(),
                  backendColumn: 'product_id',
                ),
                body: (productReturnNoteDetail) => DataCell(
                  Text(productReturnNoteDetail.productId),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'batch_no'.tr(),
                  backendColumn: 'batch_no',
                ),
                body: (productReturnNoteDetail) => DataCell(
                  Text(productReturnNoteDetail.batchNo),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'quantity'.tr(),
                  backendColumn: 'quantity',
                ),
                body: (productReturnNoteDetail) => DataCell(
                  Text(productReturnNoteDetail.quantity.toString()),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'unit'.tr(),
                  backendColumn: 'unit_id',
                ),
                body: (productReturnNoteDetail) => DataCell(
                  Text(productReturnNoteDetail.unitId),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'price'.tr(),
                  backendColumn: 'price',
                ),
                body: (productReturnNoteDetail) => DataCell(
                  Text(productReturnNoteDetail.price.format()),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'total'.tr(),
                  backendColumn: 'total',
                ),
                body: (productReturnNoteDetail) => DataCell(
                  Text(productReturnNoteDetail.total.format()),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                    label: 'created_at'.tr(), backendColumn: 'created_at'),
                body: (productReturnNoteDetail) => DataCell(
                  Text(productReturnNoteDetail.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                    label: 'updated_at'.tr(), backendColumn: 'updated_at'),
                body: (productReturnNoteDetail) => DataCell(
                  Text(productReturnNoteDetail.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'actions'.tr(),
                  backendColumn: null,
                ),
                body: (productReturnNoteDetail) => DataCell(
                  Row(
                    children: [
                      if (productReturnNote.approvedAt == null &&
                          productReturnNote.approvedById == 0)
                        ProductReturnNoteDetailDeleteButton.prepare(
                          productReturnNoteDetail: productReturnNoteDetail,
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
}
