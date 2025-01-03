import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_query/material_request_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/bloc/sales_order_attachment_query/sales_order_attachment_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/purchase_request/widget/attachment_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialRequestViewDocumentButton extends StatelessWidget {
  const MaterialRequestViewDocumentButton({
    required this.materialRequest,
    required this.bloc,
    super.key,
  });

  final MaterialRequest materialRequest;
  final PurchaseRequestQueryBloc bloc;

  static Widget prepare({
    required MaterialRequest materialRequest,
    required PurchaseRequestQueryBloc bloc,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SalesOrderAttachmentQueryBloc(),
        ),
      ],
      child: MaterialRequestViewDocumentButton(
        materialRequest: materialRequest,
        bloc: bloc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialRequestViewData.prepare(
      materialRequest: materialRequest,
      bloc: context.read<SalesOrderAttachmentQueryBloc>(),
      viewFromDetail: false,
    );
  }
}
