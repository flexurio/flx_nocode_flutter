import 'package:flexurio_chiron_material_stock/src/app/bloc/material_return_note_query/material_return_note_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return_note.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_chiron_vendor/src/app/bloc/supplier_query/supplier_query_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class MaterialReturnNoteViewPage extends StatefulWidget {
  const MaterialReturnNoteViewPage._({
    required this.materialReturnNote,
  });

  final MaterialReturnNote materialReturnNote;

  static Route<bool?> route({
    required MaterialReturnNote materialReturnNote,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MaterialReturnNoteQueryBloc()
              ..add(const MaterialReturnNoteQueryEvent.fetch()),
          ),
          BlocProvider(
            create: (context) =>
                SupplierQueryBloc()..add(const SupplierQueryEvent.fetch()),
          ),
          BlocProvider(
            create: (context) => PurchaseOrderQueryBloc()
              ..add(
                const PurchaseOrderQueryEvent.fetch(),
              ),
          ),
        ],
        child: MaterialReturnNoteViewPage._(
          materialReturnNote: materialReturnNote,
        ),
      ),
    );
  }

  @override
  State<MaterialReturnNoteViewPage> createState() =>
      _MaterialReturnNoteViewPageState();
}

class _MaterialReturnNoteViewPageState
    extends State<MaterialReturnNoteViewPage> {
  @override
  Widget build(BuildContext context) {
    const action = DataAction.view;
    final entity = Entity.materialReturnNote;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleFormPanel(
        action: action,
        entity: entity,
        size: SingleFormPanelSize.large,
        children: [
          BlocBuilder<MaterialReturnNoteQueryBloc,
              MaterialReturnNoteQueryState>(
            builder: (context, state) {
              return FormAction(
                children: [
                  RowFields(
                    children: [
                      Column(
                        children: [
                          TileDataVertical(
                            label: 'Return Number',
                            child: Text(widget.materialReturnNote.id),
                          ),
                          TileDataVertical(
                            label: 'Return Date',
                            child: Text(
                              widget.materialReturnNote.returnDate.yMMMdHm,
                            ),
                          ),
                          TileDataVertical(
                            label: 'Invoice Number',
                            child: Text(widget.materialReturnNote.invoiceNo),
                          ),
                          TileDataVertical(
                            label: 'Invoice Date',
                            child: Text(
                              widget.materialReturnNote.invoiceDate.yMMMdHm,
                            ),
                          ),
                          TileDataVertical(
                            label: 'Purchase Order Number',
                            child: Text(
                              widget.materialReturnNote.purchaseOrder.id,
                            ),
                          ),
                          TileDataVertical(
                            label: 'Purchase Order Date',
                            child: Text(
                              widget.materialReturnNote.purchaseOrder
                                  .deliveryDate.yMMMMd,
                            ),
                          ),
                          TileDataVertical(
                            label: 'Tax Invoice Number',
                            child: Text(widget.materialReturnNote.taxInvoiceNo),
                          ),
                          TileDataVertical(
                            label: 'Tax Invoice Date',
                            child: Text(
                              widget.materialReturnNote.taxInvoiceDate.yMMMdHm,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TileDataVertical(
                            label: 'Supplier ID',
                            child: Text(widget.materialReturnNote.supplier.id),
                          ),
                          TileDataVertical(
                            label: 'Supplier Name',
                            child:
                                Text(widget.materialReturnNote.supplier.name),
                          ),
                          TileDataVertical(
                            label: 'Supplier Address',
                            child: Text(
                              widget.materialReturnNote.supplier.address,
                            ),
                          ),
                          TileDataVertical(
                            label: 'NPWP Supplier',
                            child:
                                Text(widget.materialReturnNote.supplier.npwp),
                          ),
                          const TileDataVertical(
                            label: 'NPPKP Supplier',
                            child: Text('-'),
                          ),
                          TileDataVertical(
                            label: 'Remarks',
                            child: Text(widget.materialReturnNote.description),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
