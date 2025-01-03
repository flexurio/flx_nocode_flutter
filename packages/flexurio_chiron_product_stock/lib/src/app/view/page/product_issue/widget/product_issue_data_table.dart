import 'package:flexurio_chiron_product_stock/src/app/bloc/product_issue_query/product_issue_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_issue.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_issue/widget/delivery_actual_button.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_issue/widget/delivery_button.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_issue/widget/delivery_order_export_excel_button.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_issue/widget/detail_button.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_issue/widget/product_issue_global_export_pdf_button.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_issue/widget/recap_delivery_export_excel_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductIssueDataTable extends StatelessWidget {
  const ProductIssueDataTable({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) =>
          ProductIssueQueryBloc()..add(const ProductIssueQueryEvent.fetch()),
      child: const ProductIssueDataTable(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductIssueQueryBloc, ProductIssueQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<ProductIssue>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () => context
                .read<ProductIssueQueryBloc>()
                .add(const ProductIssueQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            onChanged: (pageOptions) {
              context.read<ProductIssueQueryBloc>().add(
                    ProductIssueQueryEvent.fetch(pageOptions: pageOptions),
                  );
            },
            actionRight: (refreshButton) => [
              ProductIssueRecapDeliveryReportExportExcelButton.prepare(),
              ProductIssueDeliveryOrderLeadtimeReportExportExcelButton
                  .prepare(),
              ProductIssueGlobalExportPdfButton.prepare(),
              refreshButton,
            ],
            columns: [
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  backendColumn: 'id',
                  label: 'ID',
                ),
                body: (productIssue) => DataCell(
                  Text(productIssue.id).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'sales_order_id',
                  label: 'sales_order'.tr(),
                ),
                body: (productIssue) => DataCell(
                  Text(productIssue.salesOrderId ?? '-'),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'delivery_order_id',
                  label: 'delivery_order'.tr(),
                ),
                body: (productIssue) => DataCell(
                  Text(productIssue.deliveryOrderId),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'so_input_date',
                  label: 'so_input_date'.tr(),
                ),
                body: (productIssue) => DataCell(
                  Text(
                    productIssue.soInputDate?.yMMMdHm ?? '-',
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'delivery_order_date',
                  label: 'delivery_order_date'.tr(),
                ),
                body: (productIssue) => DataCell(
                  Text(productIssue.deliveryOrderDate?.yMMMMd ?? '-'),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'end_packing_date',
                  label: 'end_packing_date'.tr(),
                ),
                body: (productIssue) => DataCell(
                  Text(productIssue.endPackingDate?.yMMMdHm ?? '-'),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'delivery_date',
                  label: 'delivery_date'.tr(),
                ),
                body: (productIssue) => DataCell(
                  Text(productIssue.deliveryDate?.yMMMdHm ?? '-'),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'created_at',
                  label: 'created_at'.tr(),
                  numeric: true,
                ),
                body: (productIssue) => DataCell(
                  Text(productIssue.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'updated_at',
                  label: 'updated_at'.tr(),
                  numeric: true,
                ),
                body: (productIssue) => DataCell(
                  Text(productIssue.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  backendColumn: '',
                  label: 'actions'.tr(),
                ),
                body: (productIssue) => DataCell(
                  Row(
                    children: [
                      ProductIssueDetailButton(productIssue: productIssue),
                      Visibility(
                        visible: productIssue.deliveryOrderDate == DateTime(0),
                        child: ProductIssueDeliveryButton(
                          productIssue: productIssue,
                        ),
                      ),
                      Visibility(
                        visible:
                            productIssue.deliveryOrderDate != DateTime(0) &&
                                productIssue.expedition == '',
                        child: ProductIssueDeliveryActualButton(
                          productIssue: productIssue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
