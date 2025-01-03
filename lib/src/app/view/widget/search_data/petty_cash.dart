import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flexurio_erp_core/src/app/view/widget/search_box/menu_tile.dart';
import 'package:flexurio_erp_core/src/app/bloc/theme/menu/menu_bloc.dart';

Widget searchPettyCash(BuildContext context, String query) {
  return VisibilityPermission(
    permission: PermissionFinance.pettyCashViewMenu,
    child: BlocBuilder<PettyCashQueryBloc, PettyCashQueryState>(
      bloc: PettyCashQueryBloc()
        ..add(
          PettyCashQueryEvent.fetch(
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
                            home: PettyCashPage.prepare(openData: e),
                            label: Entity.pettyCash.titleX,
                          ),
                        );
                        Navigator.pop(context);
                      },
                      group: Entity.pettyCash.title,
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
