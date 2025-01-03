import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_note/widget/form_review_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnNoteViewPage extends StatelessWidget {
  const ProductReturnNoteViewPage._({required this.productReturnNote});

  final ProductReturnNote productReturnNote;

  static Route<void> route(ProductReturnNote productReturnNote) {
    return MaterialPageRoute(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductReturnNoteQueryBloc()
              ..add(
                  ProductReturnNoteQueryEvent.fetchById(productReturnNote.id)),
          ),
        ],
        child: ProductReturnNoteViewPage._(
          productReturnNote: productReturnNote,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:
          BlocBuilder<ProductReturnNoteQueryBloc, ProductReturnNoteQueryState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: SomethingWrong.new,
            loading: (_) => const ProgressingIndicator(),
            loaded: (pageOptions) {
              final productReturnNote = pageOptions.data.first;
              return SingleFormPanel(
                action: DataAction.view,
                entity: Entity.productReturnNote,
                size: SingleFormPanelSize.large,
                actions:
                    _buildProductReturnNoteActions(productReturnNote, context),
                children: [
                  ProductReturnNoteFormReviewPage.prepare(
                    productReturnNoteQueryBloc:
                        context.read<ProductReturnNoteQueryBloc>(),
                    productReturnNote: pageOptions.data.first,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  List<Widget> _buildProductReturnNoteActions(
      ProductReturnNote productReturnNote, BuildContext context) {
    return [
      if (productReturnNote.approvedAt == null) ...[
        ProductReturnNoteEditButton(
          productReturnNote: productReturnNote,
        ),
        ProductReturnNoteApproveButton.prepare(
          productReturnNote: productReturnNote,
        ),
        ProductReturnNoteDeleteButton.prepare(
          productReturnNote: productReturnNote,
        ),
      ]
    ];
  }
}
