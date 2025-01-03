import 'package:flexurio_chiron_product_stock/src/app/bloc/recap_product_stock_query/recap_product_stock_query_bloc.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/recap_product_stock/util/excel_recap_product_stock.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/recap_product_stock/widget/data_table.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/recap_product_stock/widget/export_excel_button.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/recap_product_stock/widget/filter_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_identifier/screen_identifier.dart';

class RecapProductStockPage extends StatelessWidget {
  const RecapProductStockPage({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RecapProductStockQueryBloc()
            ..add(const RecapProductStockQueryEvent.fetch()),
        ),
      ],
      child: const RecapProductStockPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final recapProductStockBloc = context.read<RecapProductStockQueryBloc>();

    Widget buildFilter() {
      return SizedBox(
        width: 300,
        child: Column(
          children: [
            const SizedBox(height: 12),
            RecapProductStockFilterForm.prepare(
              recapProductStockQueryBloc: recapProductStockBloc,
            ),
            const Divider(),
            const Spacer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(child: RecapProductStockExportExcelButton()),
              ],
            ),
          ],
        ),
      );
    }

    Widget buildContent() {
      return FCard(
        padding: const EdgeInsets.all(18),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: RecapProductStockDataTable(
            recapProductStockQueryBloc:
                context.read<RecapProductStockQueryBloc>(),
          ),
        ),
      );
    }

    Widget buildExportExcelButton() {
      return BlocBuilder<RecapProductStockQueryBloc,
          RecapProductStockQueryState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: SizedBox.new,
            loaded: (recapProducStocks) {
              return Visibility(
                visible: recapProducStocks.isNotEmpty,
                child: SizedBox(
                  width: 45,
                  child: FloatingActionButton(
                    backgroundColor: Colors.blue,
                    onPressed: () async {
                      final bytes = excelRecapProductStock(
                        recapProducStocks,
                      );
                      saveFile(bytes, 'Recap Produt Stock Report.xlsx');
                    },
                    child: const Icon(
                      FontAwesomeIcons.fileDownload,
                      size: 18,
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
    }

    FloatingActionButton buildFilterButton(
      ColorScheme colorScheme,
      BuildContext context,
      RecapProductStockQueryBloc recapProductStockQueryBloc,
    ) {
      return FloatingActionButton(
        backgroundColor: colorScheme.secondary,
        child: const Icon(FontAwesomeIcons.filter),
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: RecapProductStockFilterForm.prepare(
                  recapProductStockQueryBloc: recapProductStockQueryBloc,
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
          xl: Scaffold(
            backgroundColor: Colors.transparent,
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  buildExportExcelButton(),
                  const SizedBox(
                    width: 10,
                  ),
                  buildFilterButton(
                    colorScheme,
                    context,
                    recapProductStockBloc,
                  ),
                ],
              ),
            ),
            body: buildContent(),
          ),
          xxl: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: buildContent()),
              const SizedBox(width: 24),
              SizedBox(width: 300, child: buildFilter()),
            ],
          ),
        );
      },
    );
  }
}
