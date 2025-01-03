import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_attachment_query/sales_order_attachment_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/sales_order_attachment.dart';

import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MaterialRequestViewData extends StatelessWidget {
  const MaterialRequestViewData({
    required this.materialRequest,
    required this.bloc,
    required this.viewFromDetail,
    super.key,
  });

  final MaterialRequest materialRequest;
  final SalesOrderAttachmentQueryBloc bloc;
  final bool viewFromDetail;

  static Widget prepare({
    required MaterialRequest materialRequest,
    required SalesOrderAttachmentQueryBloc bloc,
    required bool viewFromDetail,
  }) {
    return MultiBlocProvider(
      providers: const [
        // BlocProvider(
        //   create: (context) => bloc
        //     ..add(
        //       SalesOrderAttachmentQueryEvent.fetchAttachment(
        //         salesOrder: materialRequest,
        //         revisionNo: materialRequest.revisionNo,
        //       ),
        //     ),
        // ),
      ],
      child: MaterialRequestViewData(
        materialRequest: materialRequest,
        bloc: bloc,
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
    void submit(SalesOrderAttachment attachment) {
      bloc.add(
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
      heightDocument = 80;
      widthDocument = 80;
      heightImage = 110;
      widthImage = 110;
    }

    return BlocBuilder<SalesOrderAttachmentQueryBloc,
        SalesOrderAttachmentQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (attachment, _) {
            if (attachment != null) {
              late final Widget child;
              if (['jpeg', 'jpg', 'png']
                  .contains(attachment.extensionDocument)) {
                child = Image.network(
                  attachment.document.replaceAll('file/documents/', ''),
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
                          extension: attachment.extensionDocument!,
                        ),
                      ),
                      if (widthDocument != 30)
                        const Column(
                          children: [
                            Gap(6),
                            Text('File Upload'),
                          ],
                        ),
                    ],
                  ),
                );
              }
              return Row(
                children: [
                  InkWell(
                    onTap: () {
                      if (['jpeg', 'jpg', 'png']
                          .contains(attachment.extensionDocument)) {
                        showImageViewer(
                          context,
                          Image.network(
                            attachment.document
                                .replaceAll('file/documents/', ''),
                          ).image,
                          backgroundColor: Colors.black.withOpacity(.6),
                          doubleTapZoomable: true,
                        );
                      } else {
                        submit(attachment);
                        // launchUrl(
                        //   Uri.parse(
                        //     '${attachment[0].document.replaceAll('file/documents/', '')}?view=open',
                        //   ),
                        // );
                      }
                    },
                    child: child,
                  ),
                ],
              );
            } else {
              return const Row();
            }
          },
          orElse: () => const Center(child: CupertinoActivityIndicator()),
        );
      },
    );
  }
}
