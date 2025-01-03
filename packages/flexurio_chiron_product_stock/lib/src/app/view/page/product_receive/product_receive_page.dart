import 'package:flexurio_chiron_product_stock/src/app/bloc/product_receive_detail_query/product_receive_detail_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_receive/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProductReceivePage extends StatelessWidget {
  const ProductReceivePage._(this.isExternal);
  final bool isExternal;

  static Widget prepare({
    required isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProductReceiveDetailQueryBloc(isExternal: isExternal)
                ..add(
                  const ProductReceiveDetailQueryEvent.fetch(
                    status: 'KARANTINA',
                  ),
                ),
        ),
      ],
      child: ProductReceivePage._(isExternal),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(
          entity: Entity.productReceive,
          suffixText: isExternal ? ' External' : null,
        ),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ProductReceiveDataTable(
            isExternal: isExternal,
            queryBloc: context.read<ProductReceiveDetailQueryBloc>(),
          ),
        ),
      ],
    );
  }
}
