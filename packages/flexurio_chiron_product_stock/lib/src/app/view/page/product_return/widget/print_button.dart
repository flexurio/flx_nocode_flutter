import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_detail_query/product_return_detail_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return/util/pdf_product_return.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ProductReturnPrintButton extends StatelessWidget {
  const ProductReturnPrintButton({required this.productReturn, super.key});

  final ProductReturn productReturn;

  static Widget prepare(ProductReturn productReturn) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductReturnDetailQueryBloc(),
        ),
      ],
      child: ProductReturnPrintButton(productReturn: productReturn),
    );
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<ProductReturnDetailQueryBloc>();
    return BlocListener<ProductReturnDetailQueryBloc,
        ProductReturnDetailQueryState>(
      bloc: queryBloc,
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (details) async {
            final pdf = pw.Document()
              ..addPage(await pdfProductReturn(productReturn, details.data));
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'Product_Return_${productReturn.id}.pdf',
            );
          },
        );
      },
      child: IconButtonSmall(
        action: DataAction.printDeliveryOrder,
        permission: null,
        onPressed: () async {
          queryBloc.add(
            ProductReturnDetailQueryEvent.fetch(
                productReturnId: productReturn.id,
                pageOptions: PageOptions.emptyNoLimit()),
          );
        },
      ),
    );
  }
}
