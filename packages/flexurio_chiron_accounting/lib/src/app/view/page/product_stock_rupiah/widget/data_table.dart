import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/product_stock_rupiah_query/product_stock_rupiah_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/product_stock_rupiah.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/product_stock_rupiah/widget/product_stock_rupiah_export_pdf_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductStockRupiahDataTable extends StatefulWidget {
  const ProductStockRupiahDataTable({super.key});

  @override
  State<ProductStockRupiahDataTable> createState() => _ProductStockRupiahDataTableState();
}

class _ProductStockRupiahDataTableState extends State<ProductStockRupiahDataTable> {
  @override
  Widget build(BuildContext context) {
    final queryBloc = context.read<ProductStockRupiahQueryBloc>();
    return BlocBuilder<ProductStockRupiahQueryBloc, ProductStockRupiahQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<ProductStockRupiah>(
            freezeFirstColumn: true,
            onRefresh: () {
              queryBloc.add(
                ProductStockRupiahQueryEvent.fetch(
                  pageOptions: PageOptions.empty(sortBy: 'product_id'),
                ),
              );
            },
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<ProductStockRupiahQueryBloc>().add(
                ProductStockRupiahQueryEvent.fetch(
                  pageOptions: pageOptions,
                ),
              );
            },
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: () => PageOptions.empty(sortBy: 'product_id'),
            ),
            actionRight: (refreshButton) => [                  
              const ProductStockRupiahExportPdfButton(),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'product_id'.tr(),
                  backendColumn: 'product_id',
                ),
                body: (materialStockInRupiah) => DataCell(
                  Text(materialStockInRupiah.productId),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'product_name'.tr(),
                  backendColumn: 'product_name',
                ),
                body: (materialStockInRupiah) => DataCell(
                  Text(materialStockInRupiah.productName),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'unit_id'.tr(),
                  backendColumn: 'unit_id',
                ),
                body: (materialStockInRupiah) => DataCell(
                  Text(materialStockInRupiah.unitId),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'qty'.tr(),
                  backendColumn: 'qty',
                ),
                body: (materialStockInRupiah) => DataCell(
                  Text(materialStockInRupiah.qty.format()),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'primary_price'.tr(),
                  backendColumn: 'primary_price',
                ),
                body: (materialStockInRupiah) => DataCell(
                  Text(materialStockInRupiah.primaryPrice.format()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
