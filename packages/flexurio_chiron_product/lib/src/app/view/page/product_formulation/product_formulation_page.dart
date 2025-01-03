import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_detail_query/product_formulation_detail_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_query/product_formulation_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation/widget/data_table.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_formulation/widget/product_formulation_filter_form.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:screen_identifier/screen_identifier.dart';

class RndFormulationPage extends StatefulWidget {
  const RndFormulationPage({super.key, required this.isExternal});

  final bool isExternal;

  static Widget prepare({
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialQueryBloc(isExternal: isExternal)
            ..add(
              MaterialQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => ProductFormulationDetailQueryBloc(
            isExternal: isExternal,
          )..add(
              const ProductFormulationDetailQueryEvent.fetch(),
            ),
        ),
        BlocProvider(
          create: (context) => ProductFormulationQueryBloc(
            isExternal: isExternal,
          )..add(
              const ProductFormulationQueryEvent.fetch(),
            ),
        ),
        BlocProvider(
          create: (context) => MaterialUnitQueryBloc()
            ..add(MaterialUnitQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
      ],
      child: RndFormulationPage(isExternal: isExternal),
    );
  }

  @override
  State<RndFormulationPage> createState() => _RndFormulationPageState();
}

class _RndFormulationPageState extends State<RndFormulationPage> {
  bool isFiltered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final materialQueryBloc = context.read<MaterialQueryBloc>();
    final formulationDetailQueryBloc =
        context.read<ProductFormulationDetailQueryBloc>();
    final formulationQueryBloc = context.read<ProductFormulationQueryBloc>();

    Widget buildContent() {
      return StatefulBuilder(
        builder: (context, setState) {
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 24),
            children: [
              TitlePage(
                entity: Entity.billOfMaterial,
                suffixText: widget.isExternal ? ' External' : null,
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ProductFormulationsDataTable(
                  isExternal: widget.isExternal,
                  onRefresh: () {
                    isFiltered = false;
                    setState(() {});
                  },
                  isFiltered: isFiltered,
                  formulationDetailQueryBloc: formulationDetailQueryBloc,
                  formulationQueryBloc: formulationQueryBloc,
                ),
              ),
              const Gap(75),
            ],
          );
        },
      );
    }

    FloatingActionButton filterMaterial(
      ColorScheme colorScheme,
      BuildContext context,
      MaterialQueryBloc materialQueryBloc,
    ) {
      return FloatingActionButton(
        backgroundColor: colorScheme.secondary,
        child: const Icon(FontAwesomeIcons.filter),
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: ProductFormulationMaterialFilterForm(
                  fixedSize: true,
                  onFilter: () {
                    isFiltered = true;
                    setState(() {});
                  },
                  closeWhenSubmitted: true,
                  materialQueryBloc: materialQueryBloc,
                  productFormulationDetailQueryBloc: formulationDetailQueryBloc,
                ),
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
                          ProductFormulationMaterialFilterForm(
                            onFilter: () {
                              isFiltered = true;
                              setState(() {});
                            },
                            materialQueryBloc: materialQueryBloc,
                            productFormulationDetailQueryBloc:
                                formulationDetailQueryBloc,
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
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                filterMaterial(
                  theme,
                  context,
                  materialQueryBloc,
                ),
              ],
            ),
            body: buildContent(),
          ),
        );
      },
    );
  }
}
