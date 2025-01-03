import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_stock_query/material_stock_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/entity.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_stock/widget/material_stock_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MaterialStockPage extends StatelessWidget {
  const MaterialStockPage._({
    required this.isExternal,
  });
  final bool isExternal;

  static Widget prepare({
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialStockQueryBloc(isExternal: isExternal)
            ..add(
              MaterialStockQueryEvent.fetch(
                period: DateTime.now(),
                materialGroupIdIn: UserRepositoryApp.instance.department?.id ==
                        'IC'
                    ? 'BAKU,BANTU,KEMASAN,MATERIAL R&D'
                    : UserRepositoryApp.instance.department?.id == 'EN'
                        ? 'ENGINEERING'
                        : UserRepositoryApp.instance.department?.id == 'CS'
                            ? 'ALAT DAPUR,ATK,SAFETY,UMUM'
                            : UserRepositoryApp.instance.department?.id == 'VN'
                                ? null
                                : 'UMUM',
              ),
            ),
        ),
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(MaterialGroupQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
        BlocProvider(
          create: (context) => MaterialQueryBloc(
            isExternal: isExternal,
          )..add(
              MaterialQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: MaterialStockPage._(isExternal: isExternal),
    );
  }

  @override
  Widget build(BuildContext context) {
    final materialStockBloc = context.read<MaterialStockQueryBloc>();
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        BlocBuilder<MaterialStockQueryBloc, MaterialStockQueryState>(
          builder: (context, state) {
            return BlocProvider(
              create: (_) => materialStockBloc,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitlePage(
                    entity: EntityMaterialStock.materialStock,
                    suffixText: isExternal ? ' External' : null,
                  ),
                  const Gap(12),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: MaterialStockDataTable.prepare(
                      materialStockQueryBloc:
                          context.read<MaterialStockQueryBloc>(),
                      materialQueryBloc: context.read<MaterialQueryBloc>(),
                      materialGroupQueryBloc:
                          context.read<MaterialGroupQueryBloc>(),
                      isExternal: isExternal,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
