import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnDataTable extends StatefulWidget {
  const ProductReturnDataTable({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => ProductReturnQueryBloc()
        ..add(ProductReturnQueryEvent.fetch(
          status: ProductReturnStatus.input.id,
        )),
      child: const ProductReturnDataTable(),
    );
  }

  @override
  State<ProductReturnDataTable> createState() => _ProductReturnDataTableState();
}

class _ProductReturnDataTableState extends State<ProductReturnDataTable> {
  ProductReturnStatus _statusSelected = ProductReturnStatus.input;

  @override
  void initState() {
    _statusSelected = ProductReturnStatus.input;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductReturnQueryBloc, ProductReturnQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<ProductReturn>(
            freezeFirstColumn: true,
            key: ValueKey(state.hashCode),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            onChanged: (pageOptions) {
              context.read<ProductReturnQueryBloc>().add(
                    ProductReturnQueryEvent.fetch(
                        pageOptions: pageOptions, status: _statusSelected.id),
                  );
            },
            onRefresh: () => context
                .read<ProductReturnQueryBloc>()
                .add(ProductReturnQueryEvent.fetch(status: _statusSelected.id)),
            status: state.maybeWhen(
              orElse: () => Status.error,
              loading: (_) => Status.progress,
              loaded: (productReturn) => Status.loaded,
            ),
            actionLeft: [
              DropDownSmall<ProductReturnStatus>(
                initialValue: _statusSelected,
                labelText: 'Status',
                itemAsString: (status) => status.id,
                items: const [
                  ProductReturnStatus.input,
                  ProductReturnStatus.confirmMarketing,
                  ProductReturnStatus.confirmPPIC
                ],
                onChanged: (selected) {
                  if (selected != null) {
                    _statusSelected = selected;
                    context.read<ProductReturnQueryBloc>().add(
                        ProductReturnQueryEvent.fetch(
                            status: _statusSelected.id));
                  }
                },
              ),
            ],
            actionRight: (refreshButton) => [
              LightButtonSmallGroup(
                action: DataAction.exportExcel,
                children: {
                  PermissionProductStock
                          .productReturnRecapDispositionExportExcel:
                      const ProductReturnRecapDispositionExportExcelButton(),
                  PermissionProductStock
                          .productReturnLeadTimeByStatusExportExcel:
                      const ProductReturnLeadTimeByStatusExportExcelButton(),
                  PermissionProductStock.productReturnLeadTimeExportExcel:
                      const ProductReturnLeadTimeExportExcelButton(),
                  PermissionProductStock.productReturnNoteExportExcel:
                      const ProductReturnNoteExportExcelButton()
                },
              ),
              const ProductReturnOutstandingReportExportButton(),
              const ProductReturnStockReportExportButton(),
              const ProductReturnReceiveReportExportButton(),
              const ProductReturnReceiveQaCheckReportExportButton(),
              const ProductReturnNoteExportPdfButton(),
              refreshButton,
              ProductReturnCreateButton(statusSelect: _statusSelected),
            ],
            columns: [
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'ID',
                  backendColumn: 'product_returns.id',
                ),
                body: (productReturn) => DataCell(
                  Text(productReturn.id).canCopy(
                    onTap: () {
                      Navigator.push(
                        context,
                        ProductReturnViewPage.route(
                            productReturn, _statusSelected),
                      ).then((_) {
                        context
                            .read<ProductReturnQueryBloc>()
                            .add(ProductReturnQueryEvent.fetch(
                              status: _statusSelected.id,
                            ));
                      });
                    },
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Status',
                  backendColumn: 'product_returns.status',
                ),
                body: (productReturn) =>
                    DataCell(ChipType(productReturn.status)),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'reference_no'.tr(),
                  backendColumn: 'reference_no',
                ),
                body: (productReturn) =>
                    DataCell(Text(productReturn.referenceNo)),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'customer_id'.tr(),
                  backendColumn: 'customer_id.id',
                ),
                body: (productReturn) =>
                    DataCell(Text(productReturn.customer.id)),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'department'.tr(),
                  backendColumn: 'department_id.id',
                ),
                body: (productReturn) =>
                    DataCell(Text(productReturn.department.id)),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (productReturn) => DataCell(
                  Text(productReturn.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'updated_at'.tr(),
                  backendColumn: 'updated_at',
                ),
                body: (productReturn) => DataCell(
                  Text(productReturn.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'confirm_marketing_at'.tr(),
                  backendColumn: 'confirm_marketing_at',
                ),
                body: (productReturn) => DataCell(
                  Text(productReturn.confirmMarketingAt != null
                      ? productReturn.confirmMarketingAt!.yMMMMd
                      : '-'),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'confirm_ppic_at'.tr(),
                  backendColumn: 'confirm_ppic_at',
                ),
                body: (productReturn) => DataCell(
                  Text(productReturn.confirmPpicAt != null
                      ? productReturn.confirmPpicAt!.yMMMMd
                      : '-'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
