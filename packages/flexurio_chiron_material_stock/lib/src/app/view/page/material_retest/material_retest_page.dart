import 'package:flexurio_chiron_material_stock/src/app/bloc/material_rates_query/material_retest_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_retest/widget/filter_form.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_retest/widget/material_retest_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:screen_identifier/screen_identifier.dart';

class MaterialRetestPage extends StatelessWidget {
  const MaterialRetestPage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialRetestQueryBloc()
            ..add(const MaterialRetestQueryEvent.fetch()),
        ),
      ],
      child: const MaterialRetestPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<MaterialRetestQueryBloc>();
    Widget buildContent() {
      return ListView(
        children: [
          TitlePage(entity: Entity.materialRetest),
          const Gap(24),
          MaterialRetestsDataTable(
            materialRetestsBloc: queryBloc,
          ),
          const Gap(75),
        ],
      );
    }

    FloatingActionButton filterButton(
      MaterialRetestQueryBloc queryBloc,
    ) {
      return FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(FontAwesomeIcons.filter),
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AlertDialog(
                    content: FilterFormMaterialRetest.prepare(
                      materialRetestsBloc: queryBloc,
                    ),
                  ),
                ],
              );
            },
          );
        },
      );
    }

    return ScreenIdentifierBuilder(
      builder: (context, screenIdentifier) {
        return screenIdentifier.conditions(
          xxl: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: buildContent()),
                    const SizedBox(width: 24),
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          const SizedBox(height: 12),
                          FilterFormMaterialRetest.prepare(
                            materialRetestsBloc: queryBloc,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          xl: Scaffold(
            backgroundColor: Colors.transparent,
            floatingActionButton: filterButton(queryBloc),
            body: buildContent(),
          ),
        );
      },
    );
  }
}
