import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PurchaseOrderPage extends StatelessWidget {
  const PurchaseOrderPage._({
    this.openData,
  });

  final PurchaseOrder? openData;

  static Widget prepare({
    PurchaseOrder? openData,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PurchaseOrderQueryBloc()
            ..add(
              PurchaseOrderQueryEvent.fetch(
                status: [PurchaseOrderStatus.input],
              ),
            ),
        ),
      ],
      child: PurchaseOrderPage._(
        openData: openData,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (openData != null) {
        Navigator.push(
          context,
          PurchaseOrderViewPage.route(purchaseOrder: openData!),
        );
      }
    });

    return ContentWithRightPanel(
      key: ValueKey(Entity.purchaseOrder.title),
      rightPanel: ListView(
        children: [
          const Gap(24),
          TileDataVertical.titleRight(
            label: 'Created By',
            child: const PurchaseOrderChartCreateBy(),
          ),
          const Gap(42),
          TileDataVertical.titleRight(
            label: 'Related Menu',
            child: Column(
              children: [
                MenuTile(entity: Entity.purchaseRequest),
                MenuTile(entity: Entity.pettyCash),
              ],
            ),
          ),
        ],
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        children: [
          TitlePage(entity: Entity.purchaseOrder),
          const Gap(12),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const PurchaseOrderDataTable(),
          ),
        ],
      ),
    );
  }
}

class PurchaseOrderChartCreateBy extends StatelessWidget {
  const PurchaseOrderChartCreateBy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    return SizedBox(
      height: 200,
      child: UsersBuilder(
        builder: (users) {
          return BlocBuilder<PurchaseOrderQueryBloc, PurchaseOrderQueryState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (purchaseOrder) {
                  final s = groupBy(
                    purchaseOrder.data,
                    (x) => x.createdById.toString(),
                  )
                      .entries
                      .map((x) => {'x': x.key, 'y': x.value.length})
                      .toList();
                  return SfCartesianChart(
                    primaryXAxis: const CategoryAxis(),
                    series: <CartesianSeries<dynamic, dynamic>>[
                      BarSeries<dynamic, dynamic>(
                        color: primaryColor,
                        dataSource: s,
                        xValueMapper: (dynamic data, _) =>
                            users.find(data['x'] as String)?.name ?? '-',
                        yValueMapper: (dynamic data, _) => data['y'] as num,
                      ),
                    ],
                  );
                },
                orElse: () => const Center(
                  child: CupertinoActivityIndicator(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MenuTile extends StatelessWidget {
  const MenuTile({
    required this.entity,
    super.key,
  });

  final Entity entity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: FCard(
        borderRadius: BorderRadius.circular(12),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Image.asset(
              'asset/image/icon/${entity.iconPath}.png',
              width: 44,
              height: 44,
            ),
            const Gap(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entity.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    entity.subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blueGrey.shade400,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
