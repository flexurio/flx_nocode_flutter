import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_attachment_query/sales_order_attachment_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_attachment.dart';

import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SalesOrderViewData extends StatelessWidget {
  const SalesOrderViewData({
    required this.salesOrder,
    required this.viewFromDetail,
    super.key,
  });

  final SalesOrder salesOrder;
  final bool viewFromDetail;

  static Widget prepare({
    required SalesOrder salesOrder,
    required SalesOrderAttachmentQueryBloc bloc,
    required bool viewFromDetail,
  }) {
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
      child: SalesOrderViewData(
        salesOrder: salesOrder,
        viewFromDetail: viewFromDetail,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    late double heightImage;
    late double widthImage;
    late double heightDocument;
    late double widthDocument;
    SalesOrderAttachment? attachmentSet;
    void submit(SalesOrderAttachment attachment) {
      context.read<SalesOrderAttachmentQueryBloc>().add(
            SalesOrderAttachmentQueryEvent.fetchAttachmentFile(
              attachment: attachment,
            ),
          );
    }

    if (viewFromDetail == false) {
      heightDocument = 30;
      widthDocument = 30;
      heightImage = 30;
      widthImage = 30;
    } else if (viewFromDetail == true) {
      heightDocument = 100;
      widthDocument = 100;
      heightImage = 110;
      widthImage = 110;
    }

    return BlocListener<SalesOrderAttachmentQueryBloc,
        SalesOrderAttachmentQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (attachment, _) => attachmentSet = attachment,
          orElse: () => const Center(child: CupertinoActivityIndicator()),
        );
      },
      child: BlocBuilder<SalesOrderAttachmentQueryBloc,
          SalesOrderAttachmentQueryState>(
        builder: (context, state) {
          final action = <Widget>[];
          Widget widgetReturn = const Column();
          state.maybeWhen(
            orElse: () => const Center(child: CupertinoActivityIndicator()),
            loaded: (attachment, _) {
              attachmentSet = attachment;
            },
          );
          if (attachmentSet != null) {
            late final Widget child;
            if (['jpeg', 'jpg', 'png']
                .contains(attachmentSet!.extensionDocument)) {
              child = Image.network(
                attachmentSet!.document.replaceAll('file/documents/', ''),
                fit: BoxFit.cover,
                height: heightImage,
                width: widthImage,
              );
            } else {
              child = Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: widthDocument,
                      height: heightDocument,
                      child: FileExtension(
                        extension: attachmentSet!.extensionDocument!,
                      ),
                    ),
                    if (widthDocument != 30)
                      Column(
                        children: [
                          const Gap(6),
                          Text(
                            attachmentSet!.document.split('/').last,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                  ],
                ),
              );
            }
            if (viewFromDetail == false) {
              action.add(
                Row(
                  children: [
                    Tooltip(
                      message: DataAction.printPDF.title,
                      child: InkWell(
                        onTap: () {
                          if (['jpeg', 'jpg', 'png']
                              .contains(attachmentSet!.extensionDocument)) {
                            showImageViewer(
                              context,
                              Image.network(
                                attachmentSet!
                                    .document
                                    .replaceAll('file/documents/', ''),
                              ).image,
                              backgroundColor: Colors.black.withOpacity(.6),
                              doubleTapZoomable: true,
                            );
                          } else {
                            submit(attachmentSet!);
                          }
                          context.read<SalesOrderAttachmentQueryBloc>().add(
                                SalesOrderAttachmentQueryEvent.fetchAttachment(
                                  salesOrder: salesOrder,
                                  revisionNo: salesOrder.revisionNo,
                                ),
                              );
                        },
                        child: child,
                      ),
                    ),
                  ],
                ),
              );
            } else if (viewFromDetail == true) {
              action.add(
                Column(
                  children: [
                    TileDataVertical(
                      label: '',
                      child: InkWell(
                        onTap: () {
                          if (['jpeg', 'jpg', 'png']
                              .contains(attachmentSet!.extensionDocument)) {
                            showImageViewer(
                              context,
                              Image.network(
                                attachmentSet!
                                    .document
                                    .replaceAll('file/documents/', ''),
                              ).image,
                              backgroundColor: Colors.black.withOpacity(.6),
                              doubleTapZoomable: true,
                            );
                          } else {
                            submit(attachmentSet!);
                          }
                          context.read<SalesOrderAttachmentQueryBloc>().add(
                                SalesOrderAttachmentQueryEvent.fetchAttachment(
                                  salesOrder: salesOrder,
                                  revisionNo: salesOrder.revisionNo,
                                ),
                              );
                        },
                        child: child,
                      ),
                    ),
                    const Gap(5),
                    TileDataVertical(
                      label: 'Description File',
                      child: Text(attachmentSet!.description!),
                    ),
                  ],
                ),
              );
            }
            widgetReturn = action[0];
          } else {
            if (viewFromDetail == true) {
              widgetReturn = const TileDataVertical(
                label: '',
                child: Row(),
              );
            } else {
              widgetReturn = const Column();
            }
          }
          return widgetReturn;
        },
      ),
    );
  }
}
