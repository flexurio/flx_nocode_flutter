import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_detail_query/material_request_detail_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/petty_cash_create/widget/petty_cash_create_step_2_material_form.dart';

class PettyCashCreatePage extends StatefulWidget {
  const PettyCashCreatePage._();

  static Route<bool?> route() {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PettyCashBloc()),
          BlocProvider(create: (context) => MaterialRequestDetailQueryBloc()),
          BlocProvider(create: (context) => PurchaseOrderDetailQueryBloc()),
        ],
        child: const PettyCashCreatePage._(),
      ),
    );
  }

  @override
  State<PettyCashCreatePage> createState() => _PettyCashCreatePageState();
}

class _PettyCashCreatePageState extends State<PettyCashCreatePage> {
  var _page = 0;

  void _nextPage() => setState(() => ++_page);
  void _previousPage() => setState(() => --_page);

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = Entity.pettyCash;

    return BlocListener<PettyCashBloc, PettyCashState>(
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
              titles: ['type'.tr(), 'material'.tr(), 'review'.tr()],
              children: [
                PettyCashCreateTypeForm.prepare(onNext: _nextPage),
                PettyCashCreateMaterialForm(
                  key: ValueKey(_page == 0),
                  onNext: _nextPage,
                  onPrevious: _previousPage,
                ),
                PettyCashCreateReviewForm(onPrevious: _previousPage),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
