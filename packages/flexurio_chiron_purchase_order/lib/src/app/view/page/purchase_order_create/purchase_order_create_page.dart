import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_query/material_request_detail_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_temporary/material_request_detail_temporary_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order/purchase_order_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order_create/widget/discount_ppn_form.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order_create/widget/material_form.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order_create/widget/review_form.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order_create/widget/purchase_order_create_step_1_supplier_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:easy_localization/easy_localization.dart';

class PurchaseOrderCreatePage extends StatefulWidget {
  const PurchaseOrderCreatePage._();

  static Route<bool?> route() {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PurchaseOrderBloc()),
          BlocProvider(create: (context) => MaterialRequestDetailQueryBloc()),
          BlocProvider(
            create: (context) => MaterialRequestDetailTemporaryBloc(),
          ),
        ],
        child: const PurchaseOrderCreatePage._(),
      ),
    );
  }

  @override
  State<PurchaseOrderCreatePage> createState() =>
      _PurchaseOrderCreatePageState();
}

class _PurchaseOrderCreatePageState extends State<PurchaseOrderCreatePage> {
  var _page = 0;

  @override
  void initState() {
    super.initState();
  }

  void _nextPage() => setState(() => ++_page);
  void _previousPage() => setState(() => --_page);

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = Entity.purchaseOrder;

    return BlocListener<PurchaseOrderBloc, PurchaseOrderState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          action: action,
          entity: entity,
          size: SingleFormPanelSize.large,
          children: [
            MultiForm(
              page: _page,
              titles: [
                'supplier'.tr(),
                'materials'.tr(),
                'Discount & PPN',
                'review'.tr(),
              ],
              children: [
                PurchaseOrderCreateSupplierForm.prepare(
                  onNext: _nextPage,
                ),
                PurchaseOrderCreateMaterialForm(
                  key: ValueKey(_page == 0),
                  onNext: _nextPage,
                  onPrevious: _previousPage,
                ),
                PurchaseOrderCreateDiscountPpnForm(
                  onNext: _nextPage,
                  onPrevious: _previousPage,
                ),
                PurchaseOrderCreateReviewForm(
                  onPrevious: _previousPage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
