import 'package:appointment/src/app/util/picker_file.dart';

import 'package:flexurio_chiron_sales_order/flexurio_chiron_sales_order.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalesOrderDocumentButton extends StatelessWidget {
  const SalesOrderDocumentButton._({
    required this.salesOrder,
  });

  final SalesOrder salesOrder;

  static Widget prepare(SalesOrder salesOrder) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SalesOrderAttachmentQueryBloc()
            ..add(
              SalesOrderAttachmentQueryEvent.fetchAttachment(
                salesOrder: salesOrder,
                revisionNo: salesOrder.revisionNo,
              ),
            ),
        ),
      ],
      child: SalesOrderDocumentButton._(salesOrder: salesOrder),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrderAttachmentQueryBloc,
        SalesOrderAttachmentQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (document, bytes) {
            if (document != null) {
              return FileButton(
                fileName: document.document.split('/').last,
                bytes: bytes!,
                onTap: saveFile,
              );
            } else {
              return Visibility(
                child: LightButton(
                  permission: PermissionProductStock.salesOrderDetailUploadDocument,
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
    final queryBloc = context.read<SalesOrderAttachmentQueryBloc>();
    showDialog<bool?>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.transparent,
          children: [
            SalesOrderUploadDocumentForm.prepare(
              salesOrder: salesOrder,
              onPickFile: pickFile,
            ),
          ],
        );
      },
    ).then((success) {
      if (success ?? false) {
        queryBloc.add(
          SalesOrderAttachmentQueryEvent.fetchAttachment(
            salesOrder: salesOrder,
            revisionNo: salesOrder.revisionNo,
          ),
        );
      }
    });
  }
}
