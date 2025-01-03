import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_note_query/product_return_note_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_note.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_note/widget/create_button.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_note/widget/view_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnNoteDataTable extends StatelessWidget {
  const ProductReturnNoteDataTable({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => ProductReturnNoteQueryBloc()
        ..add(const ProductReturnNoteQueryEvent.fetch()),
      child: const ProductReturnNoteDataTable(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductReturnNoteQueryBloc, ProductReturnNoteQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<ProductReturnNote>(
            freezeFirstColumn: true,
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
              context.read<ProductReturnNoteQueryBloc>().add(
                    ProductReturnNoteQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            onRefresh: () => context.read<ProductReturnNoteQueryBloc>().add(
                  const ProductReturnNoteQueryEvent.fetch(),
                ),
            actionRight: (refreshButton) => [
              refreshButton,
              const ProductReturnNoteCreateButton(),
            ],
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'return_number'.tr(),
                  backendColumn: 'product_return_notes.id',
                ),
                body: (productReturnNote) => DataCell(
                  Text(productReturnNote.id).canCopy(
                    onTap: () {
                      Navigator.push(
                        context,
                        ProductReturnNoteViewPage.route(productReturnNote),
                      ).then((_) {
                        context
                            .read<ProductReturnNoteQueryBloc>()
                            .add(ProductReturnNoteQueryEvent.fetch());
                      });
                    },
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'return_date'.tr(),
                  backendColumn: 'product_return_notes.return_date',
                ),
                body: (productReturnNote) => DataCell(
                  Text(productReturnNote.returnDate.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'customer'.tr(),
                  backendColumn: 'Customer.name',
                ),
                body: (productReturnNote) => DataCell(
                  Text(
                    productReturnNote.customer.name,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'currency'.tr(),
                  backendColumn: 'Currency.id',
                ),
                body: (productReturnNote) => DataCell(
                  Text(
                    productReturnNote.currency.id,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Total',
                  backendColumn: 'product_return_notes.total',
                ),
                body: (productReturnNote) => DataCell(
                  Text(
                    productReturnNote.total.format(),
                  ),
                ),
              ),
              DTColumn(
                  widthFlex: 8,
                  head: DTHead(
                    label: 'status'.tr(),
                    backendColumn: null,
                  ),
                  body: (productReturnNote) {
                    if (productReturnNote.approvedById != 0)
                      return DataCell(
                        ChipType(
                          ProductReturnNoteStatus.approve,
                        ),
                      );
                    else
                      return DataCell(
                        ChipType(
                          ProductReturnNoteStatus.input,
                        ),
                      );
                  }),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (productReturnNote) => DataCell(
                  Text(
                    productReturnNote.createdAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'updated_at'.tr(),
                  backendColumn: 'updated_at',
                ),
                body: (productReturnNote) => DataCell(
                  Text(
                    productReturnNote.updatedAt.yMMMdHm,
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
