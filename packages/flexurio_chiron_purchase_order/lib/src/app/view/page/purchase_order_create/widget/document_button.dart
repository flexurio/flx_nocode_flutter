import 'package:appointment/src/app/util/picker_file.dart';

import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order/purchase_order_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order_document_query/purchase_order_document_query_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order_create/widget/upload_document_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchaseOrderDocumentButton extends StatelessWidget {
  const PurchaseOrderDocumentButton._({
    required this.purchaseOrder,
  });

  final PurchaseOrder purchaseOrder;

  static Widget prepare(PurchaseOrder purchaseOrder) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PurchaseOrderDocumentQueryBloc()
            ..add(
              PurchaseOrderDocumentQueryEvent.fetch(
                purchaseOrder: purchaseOrder,
                revisionNo: purchaseOrder.revisionNo,
              ),
            ),
        ),
      ],
      child: PurchaseOrderDocumentButton._(purchaseOrder: purchaseOrder),
    );
  }

  @override
  Widget build(BuildContext context) {
    final canEdit = [
      PurchaseOrderStatus.accountingConfirm,
      PurchaseOrderStatus.confirmManager,
      PurchaseOrderStatus.nextShipping,
    ].contains(purchaseOrder.status);

    return BlocBuilder<PurchaseOrderDocumentQueryBloc,
        PurchaseOrderDocumentQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (document, bytes) {
            if (document != null) {
              return FileButton(
                fileName: document.fileName,
                bytes: bytes!,
                onTap: saveFile,
                onRemove: () {
                  _showDeleteDialog(
                    context: context,
                    purchaseOrderDocument: document,
                  );
                },
              );
            } else {
              return Visibility(
                visible: canEdit,
                child: LightButton(
                  permission: null,
                  onPressed: () => _showCreateDialog(context),
                  entity: Entity.document,
                  action: DataAction.upload,
                ),
              );
            }
          },
          orElse: CupertinoActivityIndicator.new,
        );
      },
    );
  }

  void _showCreateDialog(BuildContext context) {
    final queryBloc = context.read<PurchaseOrderDocumentQueryBloc>();
    showDialog<bool?>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.transparent,
          children: [
            UploadDocumentForm.prepare(
              purchaseOrder: purchaseOrder,
              onPickFile: pickFile,
            ),
          ],
        );
      },
    ).then((success) {
      if (success ?? false) {
        queryBloc.add(
          PurchaseOrderDocumentQueryEvent.fetch(
            purchaseOrder: purchaseOrder,
            revisionNo: purchaseOrder.revisionNo,
          ),
        );
      }
    });
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required PurchaseOrderDocument purchaseOrderDocument,
  }) {
    final entity = Entity.purchaseOrderDocument;
    const action = DataAction.delete;
    final bloc = PurchaseOrderBloc();
    final queryBloc = context.read<PurchaseOrderDocumentQueryBloc>();
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<PurchaseOrderBloc, PurchaseOrderState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                queryBloc.add(
                  PurchaseOrderDocumentQueryEvent.fetch(
                    purchaseOrder: purchaseOrder,
                    revisionNo: purchaseOrder.revisionNo,
                  ),
                );
                Toast(context).dataChanged(action, entity);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<PurchaseOrderBloc, PurchaseOrderState>(
            bloc: bloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: entity,
                label: purchaseOrderDocument.documentPath,
                onConfirm: () {
                  bloc.add(
                    PurchaseOrderEvent.documentDelete(
                      document: purchaseOrderDocument,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
