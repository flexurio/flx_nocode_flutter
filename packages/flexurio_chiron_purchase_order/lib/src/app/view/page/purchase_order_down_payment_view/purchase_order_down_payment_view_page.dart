import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order_down_payment_query/purchase_order_down_payment_query_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order_down_payment.dart';
import 'package:flexurio_chiron_purchase_order/src/app/view/page/purchase_order_down_payment_view/widget/create_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';

class PurchaseOrderDownPaymentViewPage extends StatelessWidget {
  const PurchaseOrderDownPaymentViewPage._(this.purchaseOrder);

  final PurchaseOrder purchaseOrder;

  static Route<bool?> route({required PurchaseOrder purchaseOrder}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PurchaseOrderDownPaymentQueryBloc()
              ..add(
                PurchaseOrderDownPaymentQueryEvent.fetch(
                  purchaseOrderId: purchaseOrder.id,
                ),
              ),
          ),
        ],
        child: PurchaseOrderDownPaymentViewPage._(purchaseOrder),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.view;
    final entity = Entity.purchaseOrderDownPayment;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleFormPanel(
        action: action,
        entity: entity,
        size: SingleFormPanelSize.large,
        children: [
          RowFields(children: [
            TileDataVertical(
              label: 'purchase_order'.tr(),
              child: Text(purchaseOrder.id).canCopy(),
            ),
            TileDataVertical(
              label: 'Status',
              child: ChipType(purchaseOrder.status),
            ),
          ]),
          Gap(24),
          if (purchaseOrder.remainingPayment > 0)
            PurchaseOrderDownPaymentCreateButton(
              purchaseOrderId: purchaseOrder.id,
              onSuccess: () {
                context.read<PurchaseOrderDownPaymentQueryBloc>().add(
                      PurchaseOrderDownPaymentQueryEvent.fetch(
                        purchaseOrderId: purchaseOrder.id,
                      ),
                    );
              },
            ).pullRight(),
          Gap(12),
          PurchaseOrderDownPaymentTable(),
        ],
      ),
    );
  }
}

class PurchaseOrderDownPaymentTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseOrderDownPaymentQueryBloc,
        PurchaseOrderDownPaymentQueryState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (purchaseOrder) {
            return YuhuTable<PurchaseOrderDownPayment>(
              width: 1400,
              columns: [
                TableColumn(
                  width: 200,
                  title: 'due_date'.tr(),
                  builder: (data, _) {
                    return Text(
                      data.dueDate.yMMMd,
                    );
                  },
                ),
                TableColumn(
                  width: 150,
                  alignment: Alignment.centerRight,
                  title: 'amount'.tr(),
                  builder: (data, _) {
                    return Text(
                      data.amount.format(),
                    );
                  },
                ),
                TableColumn(
                  width: 100,
                  title: 'used'.tr(),
                  builder: (data, _) {
                    return BoolIcon(data.isUsed);
                  },
                ),
                TableColumn(
                  width: 150,
                  alignment: Alignment.centerRight,
                  title: 'usage'.tr(),
                  builder: (data, _) {
                    return Text(
                      data.dpUsage.format(),
                    );
                  },
                ),
                TableColumn(
                  width: 150,
                  alignment: Alignment.centerRight,
                  title: 'remaining'.tr(),
                  builder: (data, _) {
                    return Text(
                      data.dpRemaining.format(),
                    );
                  },
                ),
                TableColumn(
                  width: 140,
                  title: 'created_by'.tr(),
                  builder: (data, _) {
                    return GetNameUser(userId: data.createdById);
                  },
                ),
                TableColumn(
                  width: 170,
                  title: 'created_at'.tr(),
                  builder: (data, _) {
                    return Text(
                      data.createdAt.yMMMdHm,
                    );
                  },
                ),
                TableColumn(
                  width: 140,
                  title: 'updated_by'.tr(),
                  builder: (data, _) {
                    return GetNameUser(userId: data.updatedById);
                  },
                ),
                TableColumn(
                  width: 170,
                  title: 'updated_at'.tr(),
                  builder: (data, _) {
                    return Text(
                      data.updatedAt.yMMMdHm,
                    );
                  },
                ),
              ],
              data: purchaseOrder.data,
            );
          },
          loading: (pageOptions) => ProgressingIndicator(),
          orElse: () => SomethingWrong(),
        );
      },
    );
  }
}
