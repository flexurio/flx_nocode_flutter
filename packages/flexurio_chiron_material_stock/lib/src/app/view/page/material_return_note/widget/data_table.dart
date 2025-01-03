import 'package:flexurio_chiron_material_stock/src/app/bloc/material_return_note_query/material_return_note_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return_note.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return_note/widget/detail_button.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return_note/widget/view_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReturnNoteDataTable extends StatelessWidget {
  const MaterialReturnNoteDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialReturnNoteQueryBloc,
        MaterialReturnNoteQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<MaterialReturnNote>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
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
            onRefresh: () => context
                .read<MaterialReturnNoteQueryBloc>()
                .add(const MaterialReturnNoteQueryEvent.fetch()),
            actionRight: (refreshButton) => [
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'Return Number',
                  backendColumn: 'id',
                ),
                body: (materialReturnNote) => DataCell(
                  Text(materialReturnNote.id),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: const DTHead(
                  label: 'Supplier ID',
                  backendColumn: 'Supplier.name',
                ),
                body: (materialReturnNote) => DataCell(
                  Text(materialReturnNote.supplier.id),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: const DTHead(
                  label: 'Invoice Number',
                  backendColumn: 'return_notes.invoice_no',
                ),
                body: (materialReturnNote) => DataCell(
                  Text(materialReturnNote.invoiceNo),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'Purchase Order Number',
                  backendColumn: 'PurchaseOrder.id',
                ),
                body: (materialReturnNote) => DataCell(
                  Text(materialReturnNote.purchaseOrder.id),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  label: 'Tax Invoice Number',
                  backendColumn: 'return_notes.tax_invoice_no',
                ),
                body: (materialReturnNote) => DataCell(
                  Text(materialReturnNote.taxInvoiceNo),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (materialReturnNote) => DataCell(
                  Text(materialReturnNote.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: const DTHead(
                  label: 'Updated At',
                  backendColumn: 'return_notes.updated_at',
                ),
                body: (materialReturnNote) => DataCell(
                  Text(materialReturnNote.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: const DTHead(
                  label: 'Actions',
                  backendColumn: '',
                ),
                body: (materialReturnNote) => DataCell(
                  Row(
                    children: [
                      MaterialReturnNoteViewButton(
                        materialReturnNote: materialReturnNote,
                      ),
                      MaterialReturnNoteDetailButton(
                        materialReturnNote: materialReturnNote,
                      ),
                    ],
                  ),
                ),
              ),
            ],
            onChanged: (pageOptions) {
              context.read<MaterialReturnNoteQueryBloc>().add(
                    MaterialReturnNoteQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
          ),
        );
      },
    );
  }
}
