import 'package:flexurio_chiron_material_stock/src/app/bloc/material_return_note_detail_query/material_return_note_detail_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return_note.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return_note_detail.dart';
import 'package:appointment/src/app/view/widget/data_table_set_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return_note_detail/widget/print_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReturnNoteDetailDataTable extends StatelessWidget {
  const MaterialReturnNoteDetailDataTable({
    required this.returnNote,
    super.key,
  });

  final MaterialReturnNote returnNote;

  static Widget prepare({
    required MaterialReturnNote materialReturnNote,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialReturnNoteDetailQueryBloc()
            ..add(
              MaterialReturnNoteDetailQueryEvent.fetch(materialReturnNote),
            ),
        ),
      ],
      child: MaterialReturnNoteDetailDataTable(
        returnNote: materialReturnNote,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialReturnNoteDetailQueryBloc,
        MaterialReturnNoteDetailQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableSet2<MaterialReturnNoteDetail>(
            title:
                '${Entity.materialReturnNoteDetail.title} - ${returnNote.id}',
            search: (materialReturnNoteDetail) => [
              materialReturnNoteDetail.returnNote.id,
              materialReturnNoteDetail.currency.id,
              materialReturnNoteDetail.productId,
              materialReturnNoteDetail.productName,
              materialReturnNoteDetail.unit,
            ],
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              orElse: () => Status.error,
              loading: () => Status.progress,
              loaded: (_) => Status.loaded,
            ),
            onRefresh: () =>
                context.read<MaterialReturnNoteDetailQueryBloc>().add(
                      MaterialReturnNoteDetailQueryEvent.fetch(returnNote),
                    ),
            data: state.maybeWhen(
              loaded: (materialReturnNoteDetails) {
                return materialReturnNoteDetails;
              },
              orElse: () => [],
            ),
            actionRight: (refreshButton) => [
              MaterialReturnNoteDetailPrintButton.prepare(returnNote),
              refreshButton,
            ],
            columns: [
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Return Number'),
                  sortString: (materialReturnNoteDetail) =>
                      materialReturnNoteDetail.returnNote.id,
                ),
                body: (materialReturnNoteDetail) => DataCell(
                  Text(materialReturnNoteDetail.returnNote.id),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Product ID'),
                  sortString: (materialReturnNoteDetail) =>
                      materialReturnNoteDetail.productId,
                ),
                body: (materialReturnNoteDetail) => DataCell(
                  Text(materialReturnNoteDetail.productId),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Product Name'),
                  sortString: (materialReturnNoteDetail) =>
                      materialReturnNoteDetail.productName,
                ),
                body: (materialReturnNoteDetail) => DataCell(
                  Text(materialReturnNoteDetail.productName),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Quantity'),
                  numeric: true,
                  sortNum: (materialReturnNoteDetail) =>
                      materialReturnNoteDetail.quantity,
                ),
                body: (materialReturnNoteDetail) => DataCell(
                  Text(materialReturnNoteDetail.quantity.toString()),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Unit'),
                  sortString: (materialReturnNoteDetail) =>
                      materialReturnNoteDetail.unit,
                ),
                body: (materialReturnNoteDetail) => DataCell(
                  Text(materialReturnNoteDetail.unit),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('currency'.tr()),
                  sortString: (materialReturnNoteDetail) =>
                      materialReturnNoteDetail.currency.id,
                ),
                body: (materialReturnNoteDetail) => DataCell(
                  Text(materialReturnNoteDetail.currency.id),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Price'),
                  numeric: true,
                  sortNum: (materialReturnNoteDetail) =>
                      materialReturnNoteDetail.price,
                ),
                body: (materialReturnNoteDetail) => DataCell(
                  Text(materialReturnNoteDetail.price.format()),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Subtotal'),
                  numeric: true,
                  sortNum: (materialReturnNoteDetail) =>
                      materialReturnNoteDetail.subtotal,
                ),
                body: (materialReturnNoteDetail) => DataCell(
                  Text(materialReturnNoteDetail.subtotal.format()),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('created_at'.tr()),
                  sortNum: (materialReturnNoteDetail) =>
                      materialReturnNoteDetail.createdAt.millisecondsSinceEpoch,
                ),
                body: (materialReturnNoteDetail) => DataCell(
                  Text(materialReturnNoteDetail.createdAt.yMMMdHm),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: const Text('Updated At'),
                  sortNum: (materialReturnNoteDetail) =>
                      materialReturnNoteDetail.updatedAt.millisecondsSinceEpoch,
                ),
                body: (materialReturnNoteDetail) => DataCell(
                  Text(materialReturnNoteDetail.updatedAt.yMMMdHm),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
