import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flexurio_erp_core/src/app/view/widget/search_box/menu_tile.dart';
import 'package:flexurio_erp_core/src/app/bloc/theme/menu/menu_bloc.dart';

Widget searchPurchaseOrder(BuildContext context, String query) {
  return VisibilityPermission(
    permission: PermissionPurchaseOrder.purchaseOrderViewMenu,
    child: BlocBuilder<PurchaseOrderQueryBloc, PurchaseOrderQueryState>(
      bloc: PurchaseOrderQueryBloc()
        ..add(
          PurchaseOrderQueryEvent.fetch(
            pageOptions: PageOptions.empty(search: query, rowsPerPage: 3),
          ),
        ),
      builder: (context, state) {
        return Column(
          children: state.maybeWhen(
            orElse: () => <Widget>[],
            loaded: (pageOptions) {
              return pageOptions.data
                  .where(
                      (e) => e.id.toLowerCase().contains(query.toLowerCase()))
                  .map(
                    (e) => ItemList(
                      onTap: () {
                        MenuBloc.instance.add(
                          Menu3Selected(
                            home: PurchaseOrderPage.prepare(openData: e),
                            label: Entity.purchaseOrder.titleX,
                          ),
                        );
                        Navigator.pop(context);
                      },
                      group: Entity.purchaseOrder.title,
                      query: query,
                      title: '${e.id}',
                      trailing: Center(child: ChipType(e.status)),
                      icon: const Icon(Icons.description),
                    ),
                  )
                  .toList();
            },
          ),
        );
      },
    ),
  );
}
