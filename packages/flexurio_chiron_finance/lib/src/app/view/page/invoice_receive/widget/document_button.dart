import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/invoice_receive/invoice_receive_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/invoice_receive_document_query/invoice_receive_document_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive_document.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receive/widget/upload_document_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceReceiveDocumentButton extends StatelessWidget {
  const InvoiceReceiveDocumentButton._({required this.invoiceReceive});

  final InvoiceReceive? invoiceReceive;

  static Widget byInvoiceReceive(InvoiceReceive invoiceReceive) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InvoiceReceiveDocumentQueryBloc()
            ..add(
              InvoiceReceiveDocumentQueryEvent.fetch(
                invoiceReceive: invoiceReceive,
              ),
            ),
        ),
      ],
      child: InvoiceReceiveDocumentButton._(invoiceReceive: invoiceReceive),
    );
  }

  static Widget byPurchaseOrderId(String purchaseOrderId) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InvoiceReceiveDocumentQueryBloc()
            ..add(
              InvoiceReceiveDocumentQueryEvent.fetchByPurchaseOrderId(
                purchaseOrderId: purchaseOrderId,
              ),
            ),
        ),
      ],
      child: InvoiceReceiveDocumentButton._(invoiceReceive: null),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceReceiveDocumentQueryBloc,
        InvoiceReceiveDocumentQueryState>(
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
                    invoiceReceiveDocument: document,
                  );
                },
              );
            } else {
              if (invoiceReceive == null) {
                return Text('No document available');
              }
              return LightButton(
                permission: null,
                onPressed: () => _showCreateDialog(context),
                entity: Entity.document,
                action: DataAction.upload,
              );
            }
          },
          error: (error) => ErrorIndicator(),
          orElse: CupertinoActivityIndicator.new,
        );
      },
    );
  }

  void _showCreateDialog(BuildContext context) {
    final queryBloc = context.read<InvoiceReceiveDocumentQueryBloc>();
    showDialog<bool?>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.transparent,
          children: [
            UploadDocumentForm.prepare(invoiceReceive: invoiceReceive!),
          ],
        );
      },
    ).then((success) {
      if (success ?? false) {
        queryBloc.add(
          InvoiceReceiveDocumentQueryEvent.fetch(
            invoiceReceive: invoiceReceive!,
          ),
        );
      }
    });
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required InvoiceReceiveDocument invoiceReceiveDocument,
  }) {
    final entity = Entity.invoiceReceiveDocument;
    const action = DataAction.delete;
    final bloc = InvoiceReceiveBloc();
    final queryBloc = context.read<InvoiceReceiveDocumentQueryBloc>();
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<InvoiceReceiveBloc, InvoiceReceiveState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                queryBloc.add(
                  InvoiceReceiveDocumentQueryEvent.fetch(
                    invoiceReceive: invoiceReceive!,
                  ),
                );
                Toast(context).dataChanged(action, entity);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<InvoiceReceiveBloc, InvoiceReceiveState>(
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
                label: invoiceReceiveDocument.documentPath,
                onConfirm: () {
                  bloc.add(
                    InvoiceReceiveEvent.documentDelete(
                      document: invoiceReceiveDocument,
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
